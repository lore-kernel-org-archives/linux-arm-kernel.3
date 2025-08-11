Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAACC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvPk8m5ZZspgbKQnZyNK3R1FflZeu5kVZ+jHrZFHTFo=; b=vzUL8BtodajY9oAMWeBcEtUk/g
	KTOmJGM1+L4KxqSthcHhqaz8hM1g+88gW0OLVjPQAA0DJmPTSD9pu1duV9BeFfGUmHbu4XZKZX7/I
	dacaXRp42hXI54LRsCsKmKV4/mHsG+bxo5q39A0QPziAc6vX+lv7kJKKoCEa/pNswzcsTZYpkBD0C
	vKyvG/qVqV7UoDsBsGEJ+eARipDSivkBkJPcN5IFc7LsfmncNnjOf8ZjY221txVRZiHXRnbc2s7+t
	eebyeYTg03/oQrsPM+J4io7SPm0UyZByFBkjW/x/XAClvByY7jsHidNDj9nyX0Hc6SxEe6FOEIJAA
	19xOK9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQhh-00000007WY7-3lJO;
	Mon, 11 Aug 2025 11:28:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQIB-00000007RpE-24Lu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 11:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 891AB600BB;
	Mon, 11 Aug 2025 11:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F93BC4CEED;
	Mon, 11 Aug 2025 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754910134;
	bh=BPqTEIEi19uUvsZ3UKFemRzcPtUUh7NqCO5h9wS+W5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FPx084HykHkUTv35hbsedzLzIy1lQHXv9Mk0RLLFYL7OiL3h4HcXNECaOcOF9dyAs
	 vnoL6c7cGmmK2yaDAFxiYoKfJKJ1KFuHGx3FXu956cIGY48yeUfQqi8Ly8k+lcZv3T
	 Ibs8Ce30iF/f4ZUML5mWlyepL6aeYNq2j0zNSTtG9G7BVrOmAc/P3T0mfq5ACIZErR
	 0OAs1gRJe3U960HL2B2ijS10kVeCwY3Nzah3idNxRyaNe4fSIGWh2C1+Twcm10Fedq
	 qZczv4xfo610PcT0bpmpLY9kyYqaW/Ydq1shEmFmTfIIcNYoYD/waBGysbs8FwU9i0
	 NYVTrU2PM2HTg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Toan Le <toan@os.amperecomputing.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aIzCbVd93ivPinne@stanley.mountain>
References: <aIzCbVd93ivPinne@stanley.mountain>
Subject: Re: [PATCH next] PCI: xgene-msi: Return negative -EINVAL in
 xgene_msi_handler_setup()
Message-Id: <175491013091.15602.16180444795907652699.b4-ty@kernel.org>
Date: Mon, 11 Aug 2025 16:32:10 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 01 Aug 2025 16:34:37 +0300, Dan Carpenter wrote:
> There is a typo so we accidentally return positive EINVAL instead of
> negative -EINVAL.  Add the missing '-' character.
> 
> 

Applied, thanks!

[1/1] PCI: xgene-msi: Return negative -EINVAL in xgene_msi_handler_setup()
      commit: b26fc701a25195134ff0327709a0421767c4c7b2

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>



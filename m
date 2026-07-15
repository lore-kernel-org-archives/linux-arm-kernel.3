Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC73C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWcJy8AVXvzucJnbuxsBlK4QMspmeRMnc/T8cZju6zI=; b=P5/30BZwi8YjKM8Jj7z4W5fdD0
	15A4HORSWUHjTyEwkpI2h7+Tw16bzTWLgtPFTykLiNjLV2e3N9ZMtJI/C5M+r0fM4KI/O9oIt7wEG
	QBVPacXZdGBI2Ai1TSpdbxuJ6acurN12vUipHI4W59EhuhU+9/KkYjltfJmzj092rYRjz4fe2GGiN
	e3LdNuOjYxKkqvOPdqQc94PpffLU7JJA7XSNVqJ6JuadmvSD8fcfS8Db5zgY99MMxAUFZ7mDKDIkI
	grvr3sQ2elABHWSxSqnJAY8R8q36+Ot4/NRIT9tbYnANxWEw1aHv5Ow/rVI9DsEYcEI+GtIuUQc/v
	qcQ6AQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0KG-0000000F4Zc-28Gp;
	Wed, 15 Jul 2026 14:11:04 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0KD-0000000F4Yn-3RVc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:11:03 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h0dPX65yPzMlH0;
	Wed, 15 Jul 2026 16:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784124656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcJy8AVXvzucJnbuxsBlK4QMspmeRMnc/T8cZju6zI=;
	b=F/V3v9ut4Fa/W0qdgPuLDMrZa8vo+KfIr+ksNlDIBXglbUylOvdCqFz0FStzmwuriUxZAG
	Hoe7+6MfFp2vhIIpPVjjCDl3ywqoEh+R6qSN3eu2UVANZz4CIWOjjkB/SYDmqA8gt8at5M
	pl/tOi9uoNnxrrOCeLOAloBJmufOwr+29yU40MP3FIjnZmFRmjTKvAHNBzpTONxHh2xlmL
	XalExZfLK2g9fdLWw5W4lOOZsdOB9PHxM5vMwz15mqjXlMPnHqoR7TAeJcSGRc5xPcqhOG
	PJgyOuu9WmN29nXzzM94drty95cmLylGRWwhz7xDCf3bgr1Dj2RXxyK814P8kQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=N6c52Re9;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <e0e9e2c7-b125-4200-884b-933cc1ea6b2a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784124655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcJy8AVXvzucJnbuxsBlK4QMspmeRMnc/T8cZju6zI=;
	b=N6c52Re9g/S8W0C50YNI/VnO25lBmCiT3pzg7Arg9HRNCRZ7a/iF2/BWvohnI0kGjpm6nT
	mor+P2e80rkyO67xNEJBMc54VDsQDonKo/0FJM3BW8GjTdBXQgltedDzhRl8DOZuUbGqK+
	rUt1Ex5jW59dICVYrgPXzLgP2EtrOpaS3KevmBYpiI6OGYWW37ojfcq/4y5t6nj/KWzytD
	vtlEx3wskXPWB7TZg6a+Phpsvbo4IBenxpoOQ+Q/B0yoaEng7pFk+j83YGTcOzYo/Qj32S
	ZuttVNnxNUwRYKfH4L1HVF1anPYScQTipghFKUUPpLS+Yyh96Aric0SBiiWrzw==
Date: Wed, 15 Jul 2026 16:10:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
 <20260714211030.GA1412991@bhelgaas>
 <jipy4hvsmksv6fy352y23sjdnutpkqoi2577qp5vymqqggiscz@cnx2vijnhvh4>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <jipy4hvsmksv6fy352y23sjdnutpkqoi2577qp5vymqqggiscz@cnx2vijnhvh4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 431aabb15f8d3f0014e
X-MBO-RS-META: 3nwked576sj6tfybptqfskq4fgtauqm4
X-Rspamd-Queue-Id: 4h0dPX65yPzMlH0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_071102_038920_FDD6E39C 
X-CRM114-Status: GOOD (  11.33  )
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

On 7/15/26 4:03 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 14, 2026 at 04:10:30PM -0500, Bjorn Helgaas wrote:
>> On Tue, Jul 14, 2026 at 03:19:27PM +0200, Marek Vasut wrote:
>>> The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
>>> which are available only on ARM and ARM64, on other architectures the
>>> headers are not present and the driver fails to build. This driver is
>>> used only on ARM64 hardware, isolate its build only to ARM64 to avoid
>>> build failures on other architectures.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Mani, I assume you'll squash this into 89bded511a66 ("PCI: rcar-gen4:
>> Configure AXIINTC if iMSI-RX is not used") so it's connected to the
>> addition of the linux/irqchip/arm-gic-v3.h include and there's no
>> bisection hole?
>>
> 
> Yes, squashed now!
Thank you both.


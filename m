Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821B0C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtfCD7rb5QO4P/h/6eWSfrh0kaSPmIpDjzbAnfhNxkM=; b=ASbnQ5j4OlE4muCkkmXhiuVjJo
	ydMaQCOHtg8Rfv/oEQaWUeDMWnbSqZUOItqiQUbQ2+lbXghBGaIW74M8BVpVnGOMH6qWgZIQR24n0
	HYo4qeMC4Xiuyz5QJF1lgAjZlEZDZGiCnJIxp5jugyBtFc0QSBZ+JO77I1Fn7sWeywyPBEPQpWo+c
	pTUheDrFovJ0fIBHsDH4P0YlxEclzP1oqGo0UsEDRbjdju4dNQKFuxzGmtuBuSd2r2ziiolivbZI2
	Av7P2LoEdi4Zd+VUJAxPBP627bNBVdtT5mMP9ZYc4SwRkofPA3F6Relb+LQo9+5n33jEUyvcRPkoF
	7w6qKvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCHt-0000000FymO-0T89;
	Fri, 24 Jul 2026 09:33:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCHs-0000000FymF-1U3h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:33:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBA17600AB;
	Fri, 24 Jul 2026 09:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A471F000E9;
	Fri, 24 Jul 2026 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784885627;
	bh=PtfCD7rb5QO4P/h/6eWSfrh0kaSPmIpDjzbAnfhNxkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GDda7O+wEZ81EaozM5gRovWq+RtY0kUukOgDamROaqOXqz/WQCIK9Bd7hV0c0xp0K
	 KxhKYgCs0GwxOkT3WlwPKUpdY/s4C9N96QL3gGf8XFs8MCTwfrC95HA1W14fir+31x
	 mORhDkCOMzuMDljM4/vGVdhWNBrJKzXq8cXVf46C9D0FjeYaUN+D5UzKwDsziqT9yY
	 N/a+1U774RDGCJ9X7fft4CTJciEHRsKBw4X7eeeuhui7q7AJSDUmG1I/uhYAPSnm/X
	 N3AZ0grjZ38K4q1Bg1t5EL/TdciGZ0nkozJSbZHsVU/+VaIxqqwZkER5BcxunDVv9X
	 IAVnp8/33q5Ig==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Roll back partial protocol table registration
Date: Fri, 24 Jul 2026 10:33:42 +0100
Message-ID: <178488559184.2847802.3631237341330785871.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722173521.2184378-1-sudeep.holla@kernel.org>
References: <20260722173521.2184378-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 22 Jul 2026 18:35:20 +0100, Sudeep Holla wrote:
> scmi_protocol_table_register() can leave earlier requests registered when
> a later entry in the same ID table fails. Each request retains a pointer
> to the driver's ID table, so a failed module load can leave a dangling
> pointer after the module storage is released.
> 
> Unrequest only the successfully registered prefix, in reverse order,
> before returning the failure. Leave the failed entry and the remaining
> entries untouched because matching requests can be owned by another
> driver.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Roll back partial protocol table registration
      https://git.kernel.org/sudeep.holla/c/2224b622260b
[2/2] firmware: arm_scmi: Unrequest devices if driver registration fails
      https://git.kernel.org/sudeep.holla/c/9f7cd6a62aa7
-- 
Regards,
Sudeep



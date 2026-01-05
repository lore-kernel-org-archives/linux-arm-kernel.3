Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8187C2A07B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emKIByfXGmPnCS6jAiZsoKAy6fQFYwuuRgiRa12+j8g=; b=F3aQ/dTyvL9E8Zii/48Osu7jx8
	3cUN3LwSmf5BWwhA6YNI7WrGY6fEMzAmRt9HHvR8sfhbCBvvLYzDoAFbewlbAtNjCZN6zmABmOdgR
	wRohNGhrYs395hfatWVQV5Yo5arspl8Z484/lA9yLNGoXyH2tE6dn4eFyb/wisycLIRdPMZ4xSg5y
	IvKRUxkr19eGvv5mBN/rZwC+4c1FAIVzdDZKuVvS6RqfAnoYsIIeQz+ha12I/mmly0f8Wl21G0cKB
	Bpb9dQMdPrwi0O08U1SZNU5YAmFndbnpftk9aQAQ/naPfCPj1SRx3y0wCHVt5jsmv7IhCPWj7+RjE
	2oa2Nrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgt5-0000000B44U-2uJ6;
	Mon, 05 Jan 2026 09:28:31 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgt3-0000000B449-13Xw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 09:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=emKIByfXGmPnCS6jAiZsoKAy6fQFYwuuRgiRa12+j8g=; b=TOWfQzGKPksIysId1zH63kpqpa
	EcO2JNyxw2G88PRxMO76uG1Vdt1iyA+QW/O23xppemvAsbhNACSL4MnpergTnAAeGFPLFfIPA4ASo
	9O0iNRTYZkHsf05jyv46P8hTk6FpF2/PORUdVI58W/2gvm8KpnQpVOYc6F9LlDjqjqXWzYZRf4Z0E
	NqPNU6XBARYNNtS2zpG1rGUwaHHNhABmw9LHjYep937mBVmVEU/ub0p3RW7TWEB95wZt8vaLmQZ/G
	mg73CcMSdh+HO2AKdIVaxjh/RWtP4Ff8IOU3VaIR7yLZkSCyMf4CM5a7S2bxvuoTDjiQ6i38gI1c+
	ogAmf1Fw==;
Date: Mon, 5 Jan 2026 10:27:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linux@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2: Fix reference count leaks in
 omap_control_init()
Message-ID: <20260105102704.77d4c9d1@kemnade.info>
In-Reply-To: <20251217142122.1861292-1-vulab@iscas.ac.cn>
References: <20251217142122.1861292-1-vulab@iscas.ac.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_012829_319080_280A35FF 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

On Wed, 17 Dec 2025 14:21:22 +0000
Wentao Liang <vulab@iscas.ac.cn> wrote:

> The of_get_child_by_name() function increments the reference count
> of child nodes, causing multiple reference leaks in omap_control_init():
> 
> 1. scm_conf node never released in normal/error paths
> 2. clocks node leak when checking existence
> 3. Missing scm_conf release before np in error paths
> 
> Fix these leaks by adding proper of_node_put() calls and separate error
> handling.
> 
> Fixes: e5b635742e98 ("ARM: OMAP2+: control: add syscon support for register accesses")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>


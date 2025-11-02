Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D4FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygryKpuel8gUruAmxT7tunoXHxgWnszjIWDtcSkyXgY=; b=tTOcypA1oFC16r02Iw3WXyp7CZ
	AuUGKOSrmIqK3BHRU+iXEHze656M0+rSocRlEa3t4INTwOGSduwaqNBOMThsA5ri0x8D4qreBHgOd
	jo3rotxlFBQcJHXXB26OKYNg3izjHc3WtczV+H5seWqiAIXzRyn8s5Q/UsBvMMmzmwu4FGRkjb3TU
	Jd5lSMw2IqEs2j1s5cE0FG/zcTG1GzvPiZq+uwkbd/ejqgRl+5PzlnOn7opPg29ypIyZnz8f8tvQ8
	AbJWna0t7BZVEwr3u4PDsTbvUr1YCx7Hm/Uev6Gtk6T81f6thzDDeBABF3YPfkvOEAgIH2GRC7OYV
	QlbOdR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVnU-00000008UVU-3MK8;
	Sun, 02 Nov 2025 10:58:56 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFVnQ-00000008UUj-3THG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 10:58:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E3C63219A1;
	Sun,  2 Nov 2025 10:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762081129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygryKpuel8gUruAmxT7tunoXHxgWnszjIWDtcSkyXgY=;
	b=Gu12e4Ry+Pcag5JF+IO8aXX0WuYRrmk4kvzlTuUPMwqAOzrnEVqOsREWVgL7TBQq/Or2nT
	GfPMN5WI7kzzxAzZgyrmPDgaLF3AyU7eWvntl1gvg8pPt38M9jgbQWqmtyXcKlvic2oRGz
	RScb1UQJx/9v4isNnYjnwAmj84wzyzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762081129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygryKpuel8gUruAmxT7tunoXHxgWnszjIWDtcSkyXgY=;
	b=yKvYyrFg2dtifnKDrHvMlNargw9E7uCo1QCOApxR594EQZBnFmCuyNSgJ+vmJqm6XG62qh
	EsSa6mULWxS5+/DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ic5hceXH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zjJLpUZo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762081127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygryKpuel8gUruAmxT7tunoXHxgWnszjIWDtcSkyXgY=;
	b=ic5hceXH/0ta/+C0Tq1Dk9YbRtNQDvlHSmqog+Dxux6lRa/0SjWPhjSn4/Nphi+rTWTois
	8AwTWk+MGFzMD24e5AGOkPvPagBWPf3fPHtYGv4/cAmwP0FU5ixsdXq/7/cz7c4AmOfa8D
	YMrrmLIjmld/UAxIOL0xP09tIuQRxuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762081127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ygryKpuel8gUruAmxT7tunoXHxgWnszjIWDtcSkyXgY=;
	b=zjJLpUZoyhX7CrHvi6rIX3VZKcLqKfd8kCvaIfiinx5W1Wj+FkYTrMAynK4DfvQzNBkeUC
	amFVwGhq8qDJbtAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44DDA13699;
	Sun,  2 Nov 2025 10:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MNZzDmc5B2mYMgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Sun, 02 Nov 2025 10:58:47 +0000
Message-ID: <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
Date: Sun, 2 Nov 2025 12:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>, Andrew Lunn <andrew@lunn.ch>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Phil Elwell <phil@raspberrypi.com>,
 Rob Herring <robh@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
References: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E3C63219A1
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,ideasonboard.com:email,suse.de:dkim,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_025853_009334_DACC53D6 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Laurent,

Thank you for the patch!

On 11/2/25 2:29 AM, Laurent Pinchart wrote:
> The RP1 ethernet controller DT node contains a local-mac-address
> property to pass the MAC address from the boot loader to the kernel. The
> boot loader does not fill the MAC address as the ethernet0 alias is
> missing. Add it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> index 04738bf281eb..fa438ac8c9ef 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> @@ -10,6 +10,7 @@ / {
>  	model = "Raspberry Pi 5";
>  
>  	aliases {
> +		ethernet0 = &rp1_eth;
>  		serial10 = &uart10;
>  	};
>  

Unfortunately this does not compile:

make[1]: Entering directory '/rpi5/kobj'
  GEN     Makefile
  DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb
  DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb
  DTC     arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb
/linux/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:12.10-15.4:
ERROR (path_references): /aliases: Reference to non-existent node or
label "rp1_eth"

ERROR: Input tree has errors, aborting (use -f to force output)
make[4]: *** [/linux/scripts/Makefile.dtbs:132:
arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/linux/scripts/Makefile.build:556:
arch/arm64/boot/dts/broadcom] Error 2


I've made following fix on top of your patch, but I'm not sure that it
is the correct one.

Andrea, could you comment please?

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
index bbad90d497fa..734b06ac5ba2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
@@ -9,8 +9,7 @@ / {
 	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
 	model = "Raspberry Pi 5";

-	aliases {
-		ethernet0 = &rp1_eth;
+	aliases: aliases {
 		serial10 = &uart10;
 	};

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 9f1976f0fd1a..26a99e72d441 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -22,6 +22,10 @@ &pcie2 {
 	#include "rp1-nexus.dtsi"
 };

+&aliases {
+	ethernet0 = &rp1_eth;
+};
+
 &rp1_adc {
 	vref-supply = <&rp1_vdd_3v3>;
 	status = "okay";

~Stan



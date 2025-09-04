Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDA0CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b/BmwCHo3DYuUf45IMBYRttwgcEiOlqLTxtBwVnepE=; b=lQW7znYyneCx23nhTeSJ2fmQGE
	oZHDq1SFn94Zmk30PGrMzoBQi452D7jeveLRIppCzhEgHoE88uuCQlD7b//xHcNfAyo5cd9kn7wni
	Ec9nFevm2beUeOKHDdkW/FM5zlAYap879YFY4OIEbBEZQph/AWQvqrBa1Bd+6FLXdFy8VM/TSEsGZ
	PZTmgMxwaZDlh5Sv+5Z5SwKBXJs6O2JuZp+9Tyzh94qq76blbwk1WbefEGIyncqsZYuoD/Q1I3O5M
	wdYHLRxjqatpZ4zABLyG4AJh6wqvQJzmLsIfDFJn2eG4RKzJqogY+bNnI4+eGm0N0/YonfX7gFiCD
	9kIPo6ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8hY-0000000BQgV-2Qy1;
	Thu, 04 Sep 2025 12:04:28 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7US-0000000Azau-3jFs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 10:46:54 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB0F834686;
	Thu,  4 Sep 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756982810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b/BmwCHo3DYuUf45IMBYRttwgcEiOlqLTxtBwVnepE=;
	b=tYNoP2qnZiSBl30cMkXM7/dfO96kCHMPVpDcyEmy9w4dWuPVGv0Q+UwppVH3Qoc5NqujDE
	JkUievBTc5YuI8z+GBNZ0LIRvQ9hdAbQgBqrPhGZ6C5I+p8yc9N2AVHokS3CfaONNuMK2W
	1iBuxPvbYUr/Xugowj6rluLFDHBgsW4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756982810;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b/BmwCHo3DYuUf45IMBYRttwgcEiOlqLTxtBwVnepE=;
	b=c7U2KoOErjsy3w0mCFjHQwE4NKy7dyAxbHmy7a/T75FGQ2bUDRgsZsfpbFEkvcBAdJ4+6M
	HMUiGPrkzkHaO1BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756982809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b/BmwCHo3DYuUf45IMBYRttwgcEiOlqLTxtBwVnepE=;
	b=xCFEZysu+ba84tPub0epTpg0jqBQ2T/QV0U4EKlnW5zRHPExlqysts7CEKV9jhJhGOdpbv
	+aP0kcaoZAC5sKZ9FS2jXm2pEXC0U4biVAsjvioZzsTguczPedYFO24SJZKhMQHbjq5N8v
	jHpC80mPAmnAjFix2fm3rwMpUJtRMEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756982809;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6b/BmwCHo3DYuUf45IMBYRttwgcEiOlqLTxtBwVnepE=;
	b=ReEa+1d15fQxlC+zjJ8/sNG+3py6SgBN3tzxpmAow/ICwl5xhnc5mwKL6VeBfDHvruuDzp
	Q6N+g+mexFEL68Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B542213675;
	Thu,  4 Sep 2025 10:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kD0FKRhuuWhBNAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 04 Sep 2025 10:46:48 +0000
Message-ID: <50b59b27-cdf9-4af8-b31d-d5ccc68c73fd@suse.de>
Date: Thu, 4 Sep 2025 13:46:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: broadcom: rp1: Add USB nodes
To: Andrea della Porta <andrea.porta@suse.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iivanov@suse.de, svarbanov@suse.de,
 mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>
References: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <4e026a66001da7b4924d75bd7bee158cbb978eed.1756387905.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_034653_102157_BF0C7819 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Andrea,

Thank you for the patch!

On 8/28/25 4:50 PM, Andrea della Porta wrote:
> The RaspberryPi 5 has RP1 chipset containing two USB host controller,
> while presenting two USB 2.0 and two USB 3.0 ports to the outside.
> 
> Add the relevant USB nodes to the devicetree.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  arch/arm64/boot/dts/broadcom/rp1-common.dtsi | 28 ++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> index 5002a375eb0b..116617fcb1eb 100644
> --- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
> @@ -39,4 +39,32 @@ rp1_gpio: pinctrl@400d0000 {
>  			     <1 IRQ_TYPE_LEVEL_HIGH>,
>  			     <2 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> +
> +	rp1_usb0: usb@40200000 {
> +		reg = <0x00 0x40200000  0x0 0x100000>;
> +		compatible = "snps,dwc3";
> +		dr_mode = "host";
> +		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
> +		usb3-lpm-capable;
> +		snps,dis_rxdet_inp3_quirk;
> +		snps,parkmode-disable-ss-quirk;
> +		snps,parkmode-disable-hs-quirk;
> +		snps,tx-max-burst = /bits/ 8 <8>;
> +		snps,tx-thr-num-pkt = /bits/ 8 <2>;
> +		status = "disabled";
> +	};
> +

I'd order the generic properties first and then vendor specific.
Something like this:

rp1_usb0: usb@40200000 {
	compatible = "snps,dwc3";
	reg = <0x00 0x40200000 0x0 0x100000>;
	interrupts = <31 IRQ_TYPE_EDGE_RISING>;
	dr_mode = "host";
        ....
}

> +	rp1_usb1: usb@40300000 {
> +		reg = <0x00 0x40300000  0x0 0x100000>;
> +		compatible = "snps,dwc3";
> +		dr_mode = "host";
> +		interrupts = <36 IRQ_TYPE_EDGE_RISING>;
> +		usb3-lpm-capable;
> +		snps,dis_rxdet_inp3_quirk;
> +		snps,parkmode-disable-ss-quirk;
> +		snps,parkmode-disable-hs-quirk;
> +		snps,tx-max-burst = /bits/ 8 <8>;
> +		snps,tx-thr-num-pkt = /bits/ 8 <2>;
> +		status = "disabled";
> +	};
>  };



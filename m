Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B15C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 19:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgYGEkJt3VCybdxa1+YIDFMAdYlcqDVQpOv3hqdiLPM=; b=xtJkLqiI46DNx7QGOMmY4XRHhH
	yR/8HwaVnNmIRqUbpFN9I1pMA9s/RAAblbvdSKcjOZEFfKbOerGq9ToUhWnAfGuBSxZmUGfpDpLFT
	e8CPEWkOaqXRzJUuuXk57depwEAMUCY/ZQ58QdlMMH7HOPjOEhmPkl3YC0wszUSaCMWQAwRKz0mRP
	0ozljRlErHG13okMNFw45dNGylzw6Xf9ABP/NXofO7wdR4dpHie2IKAvJPMzZgbzYOnHVjNQy+1No
	osq83KYt7PPNteqBHzAQ5MxrFi/y+yvgle989YuIVKrVquWauQ0+FFtncxZm5eaAt+4NW7By/zC0g
	dG81W9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMu1U-0000000E7Mh-2m6E;
	Wed, 04 Jun 2025 19:43:40 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMt0C-0000000E2Ke-2EOu;
	Wed, 04 Jun 2025 18:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749062290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XpxOfDMkMTehlhbi+CGReSWqqUMLkmJnUczaQxUGlmri2hdiu3/hj2DnzxJAbaMW7Gj2P9oRvLjx1biYSoxpV0WcPjNQZHTZJdSodzQboRPeyBb1iq4+y7IDIA/jC9RV4TlFhJXLFFcofKaBRw1xu0Zgk+o/AC2HzvhqW5fjdaU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749062290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GgYGEkJt3VCybdxa1+YIDFMAdYlcqDVQpOv3hqdiLPM=; 
	b=iHBThtcll7E39v7NeNOx45NsPxRMeGolvpLc9IdPQP5E0PCtiEEO17hMMFlxvfWuc60U81RpSmcUTt/6kyKTT758/EE0x0AQx46u3k7Qi0vaMUmdB6FImW1Fu8R8SIDVayVlOi7bKLU7y92ugGUhEvkQyGj0zbUjqpK0HgT4Cv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749062290;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=GgYGEkJt3VCybdxa1+YIDFMAdYlcqDVQpOv3hqdiLPM=;
	b=lFCXOENqlwkxoQjE2Q9bGDzFbMvHdKtwOBOlg53icWk8zBnj6ibTxwrIaTbZsrxq
	RVBFVughZgUbhFNYqNfjHr/fVrIN+Ib+q/tmu8mBHQpb+BHBiY52Un7xwOmnzII7oIz
	1NABwjHc+h3GFQdT+itsOmMDXN/5/Src+i54Sg+Y=
Received: by mx.zohomail.com with SMTPS id 1749062288242553.3001727608961;
	Wed, 4 Jun 2025 11:38:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Wed, 04 Jun 2025 20:38:03 +0200
Message-ID: <6656934.DvuYhMxLoT@workhorse>
In-Reply-To: <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_113816_637129_76AFC00E 
X-CRM114-Status: GOOD (  14.87  )
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

On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey Charkov wrote:
> List both CPU supply regulators which drive the little and big CPU
> clusters, respectively, so that cpufreq can pick them up.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d677cdc98fb50353418 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
>  	};
>  };
>  
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
>  &combphy0_ps {
>  	status = "okay";
>  };
> @@ -215,6 +231,18 @@ &cpu_l0 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
>  &gmac0 {
>  	phy-mode = "rgmii-id";
>  	clock_in_out = "output";
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

> so that cpufreq can pick them up.

Fwiw, even without this patch they're picked up by cpufreq-dt for me:

    user@trixie:~$ sudo cpupower frequency-info 
      analyzing CPU 5:
      driver: cpufreq-dt
      CPUs which run at the same hardware frequency: 4 5 6 7
      CPUs which need to have their frequency coordinated by software: 4 5 6 7
      maximum transition latency: 40.0 us
      hardware limits: 408 MHz - 2.30 GHz
      available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz, 1.20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
      available cpufreq governors: ondemand userspace performance schedutil
      current policy: frequency should be within 408 MHz and 2.30 GHz.
                      The governor "schedutil" may decide which speed to use
                      within this range.
      current CPU frequency: 1.61 GHz (asserted by call to hardware)
    user@trixie:~$ uname -a
    Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4 20:32:52 CEST 2025 aarch64 GNU/Linux

this is more correct though of course.

Kind regards,
Nicolas Frattaroli




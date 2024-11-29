Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987C8D70E1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 05:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJvwqiaal1EaQSpBB0Sl+EHlw0k4hE//iJpExas7lYg=; b=Ou+4dZIEt/L9Wf
	Wz2bL7+ZRE0hna/9U5LsEnFh6fYYMT3Vkyscd4ZnpZXHBEOqPPbuc1Oeup8gkz/bf/jqjnhul0NXI
	5YvAVQ1a4NpYB5JQPvcIWi4ls21JGW6UDQs4WrkI2L4OhCVYQ6qlXT/bFwoqUBaxZUakPH4UcNgoS
	94U/QMUh/8bSZPr5ILngwcb1bYP7PD5WjnV0uuIYh0XKJx42IqdHeTGHkVtUcL6S2djtVw2comnLO
	9TA3zn5Bhb9ifsTfWI0MFrij0UpukhvjX8kPmjq28zH3pNY5cNTfsC9NIWt28otBXc37tonBUmvix
	VR74UHSkDZNRdnLIuEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGtKn-0000000Guuw-1GVO;
	Fri, 29 Nov 2024 05:14:29 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGtJp-0000000Gupb-0Rlz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 05:13:30 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so1427442e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 21:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732857203; x=1733462003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJvwqiaal1EaQSpBB0Sl+EHlw0k4hE//iJpExas7lYg=;
        b=mwsFRwC9zHr+K4n+tMqwxpqhUy2A5XLbjmD3uuJ5+/d8CcjbwCdUDWH+S51C9E69D+
         4cXCRanqaf+mP6ItNVTG9S2Vw+ApwOosBqqPhs9TFqi/TgE966fjZv+o7yHE/tv/ELX2
         4hSrO9wU15ejeLXc6ufThM5EMn9NHFtml6jZ+cxIzfm1rOlGNsqDLXgyAV1oB+W/Xzdg
         3YzWShvWNZ/oCfBoRZyaTug5DxF0zicuELhk0aP5tZ4/nqNScsX15zpUsk4OJ0Ej9H+T
         SEa4GdVc9B+oIHca7LCkGd33TGTl5Kt3MESLaE2+sgs11Oa+fxPlAnWoQoBiKfulPk6v
         ppaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLb1dPQ1LdieyvPQJrl7GsedBYHkxHYjj528xQEKafEuafpXT50igZ0DihwDlsZ+ty+AIG1DAQ+xfu68xrQPQQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJAVRmz4jifKyrcgLu0NtJ3xyRZyPAX5pRPuHPlZdPxLjdHdLc
	OdOVyD5RGrN6tFI4tf4TFrpM8nf+5XU++0Vz8bTsOQAZcO+OIfAxdxny/zzl
X-Gm-Gg: ASbGnctahCK460Av5qCprQgg5NuiOWjBNdvinQNXw4ORVL2GHdDgNqH89BBceHRq4+S
	Tcxn2XfYQZQhCl9BBMKgTlW6+3NLhY0AnM/fP8APJRXECLv+9pqK1GB9ZYUeT+Aro2A5CmRPDct
	hRQHywKdCC3NcLO303pJtG1IitT3DpFyt2Q/JPKNkeuvPQRLcGjXjAlvV+dqZkqJ7U3L2ixPXEP
	xDajHIWNi5g40rJqRqX8+/toAS7jov+5KGuAWPzEmS/skAQPcy3anq66Pfub33MliXyAMBSxVHe
	iL02f00=
X-Google-Smtp-Source: AGHT+IHuvwNUweQWSh0eDZUcN69LL+IlEYOXU3vo/RYxYoQ+IyRQz1nOik/VS4wxrbtbjNzqQe7KzQ==
X-Received: by 2002:a05:6512:2813:b0:53d:f700:6456 with SMTP id 2adb3069b0e04-53df7006492mr1445749e87.12.1732857203006;
        Thu, 28 Nov 2024 21:13:23 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f043sm371791e87.137.2024.11.28.21.13.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:13:22 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc380b1d0so14839851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 21:13:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1n/DFe/8xV1Cp9Oyo3ueQ6e4kGRwu7yp62CMTTPptRvyylR+lrX8zW5WhsWGwpx5JEzf0uWd3EIHNdoIhyWuY@lists.infradead.org
X-Received: by 2002:a2e:9687:0:b0:2ff:e54a:cd08 with SMTP id
 38308e7fff4ca-2ffe54acea4mr7224861fa.3.1732857201437; Thu, 28 Nov 2024
 21:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20241128154556.2743839-1-simons.philippe@gmail.com>
In-Reply-To: <20241128154556.2743839-1-simons.philippe@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 29 Nov 2024 13:13:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
Message-ID: <CAGb2v64b-m8XoXWXyPFLZKpfTJd2beE_QjUUbf17o4y_rfTmJg@mail.gmail.com>
Subject: Re: [PATCH] Update H700 opp values
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_211329_169559_BFFA9E8F 
X-CRM114-Status: GOOD (  17.33  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 28, 2024 at 11:46=E2=80=AFPM Philippe Simons
<simons.philippe@gmail.com> wrote:
>
> My H700 (RG35XX-H, RG40XX-V and RG CubeXX) devices are very unstable,
> especially with some OPPs.
> Crashes were fairly easy to reproduce with any dynamic cpufreq governor
> and some load on CPU, usually in matter of minutes.
> Crashes manifested randomly as simply hanging or various kernel oops
>
> Manufacturer (Anbernic) is using more conservative mircrovolt values,
> so let's use these.
> While using performance gov seems stables at 1.5Ghz, it still crashes
> using a dynamic gov (even with Andre reparenting patch), so let's drop
> it for now, like manufacturer does.
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com
> ---
>  .../dts/allwinner/sun50i-h616-cpu-opp.dtsi    | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> index dd10aaf47..ac13fe169 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-cpu-opp.dtsi
> @@ -50,24 +50,21 @@ opp-1008000000 {
>                         opp-microvolt-speed2 =3D <950000>;
>                         opp-microvolt-speed3 =3D <950000>;
>                         opp-microvolt-speed4 =3D <1020000>;
> -                       opp-microvolt-speed5 =3D <900000>;
> +                       opp-microvolt-speed5 =3D <950000>;

It seems that you are encountering the issues on this particular binning.
Could you mention that in the commit message?

It's not very obvious that H700 =3D=3D a particular speed bin of H616.

ChenYu

>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x3f>;
>                 };
>
>                 opp-1032000000 {
>                         opp-hz =3D /bits/ 64 <1032000000>;
> -                       opp-microvolt =3D <900000>;
> +                       opp-microvolt =3D <950000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x20>;
>                 };
>
>                 opp-1104000000 {
>                         opp-hz =3D /bits/ 64 <1104000000>;
> -                       opp-microvolt-speed0 =3D <1000000>;
> -                       opp-microvolt-speed2 =3D <1000000>;
> -                       opp-microvolt-speed3 =3D <1000000>;
> -                       opp-microvolt-speed5 =3D <950000>;
> +                       opp-microvolt =3D <1000000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x2d>;
>                 };
> @@ -79,7 +76,7 @@ opp-1200000000 {
>                         opp-microvolt-speed2 =3D <1050000>;
>                         opp-microvolt-speed3 =3D <1050000>;
>                         opp-microvolt-speed4 =3D <1100000>;
> -                       opp-microvolt-speed5 =3D <1020000>;
> +                       opp-microvolt-speed5 =3D <1050000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x3f>;
>                 };
> @@ -93,7 +90,10 @@ opp-1320000000 {
>
>                 opp-1416000000 {
>                         opp-hz =3D /bits/ 64 <1416000000>;
> -                       opp-microvolt =3D <1100000>;
> +                       opp-microvolt-speed0 =3D <1100000>;
> +                       opp-microvolt-speed2 =3D <1100000>;
> +                       opp-microvolt-speed3 =3D <1100000>;
> +                       opp-microvolt-speed5 =3D <1160000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
>                         opp-supported-hw =3D <0x2d>;
>                 };
> @@ -102,9 +102,8 @@ opp-1512000000 {
>                         opp-hz =3D /bits/ 64 <1512000000>;
>                         opp-microvolt-speed1 =3D <1100000>;
>                         opp-microvolt-speed3 =3D <1100000>;
> -                       opp-microvolt-speed5 =3D <1160000>;
>                         clock-latency-ns =3D <244144>; /* 8 32k periods *=
/
> -                       opp-supported-hw =3D <0x2a>;
> +                       opp-supported-hw =3D <0x0a>;
>                 };
>         };
>  };
> --
> 2.46.1
>


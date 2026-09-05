Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08EAC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=; b=kFhBZ6T0XvVRvJHBngB5QXUmoT
	6vv4VeSxATg6YwBDlJvQjFJ6mxtbmkHyjcomAcPFgSIIuwgB0rUHYBzT01LjoOAfHJz3O18uIJVx4
	JCmne/vfsq1LRvdfOfql8IYKNN07XRqliJFT1GGsHdUlztHEQx9QQ9A5Bx8DnPFwVDyK+55T/J5OW
	Vy0rbbiqeReb1bjgaT2aFlQBRyDAeHgOKAYwFJR68ih9yfGyf1WUtgM5Pzv5XsvxROyarQSxft8Eo
	B3f+ogYjfJvIWpcTrBc6w3741wAXqsrLyEXKrvntLmEPkIc91wD08zTj1x7VAgSV/5G6Md/ON4+Qq
	xYkrNVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lie-00000003rH5-1HU4;
	Sat, 05 Sep 2026 08:25:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lib-00000003rGV-47XQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:25:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso2102590a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788596743; x=1789201543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=N/Y1BK81apPUt/ScsRCXFLP+0Yfsqg5yqhqVK9qtfIwn+iQpuDKI+p3q7FFHrRmWpF
         WNHd8+3Mrkw3p/t2EAxe/eWfSHLb3QyRfLErfNnecchf0umm+jzYoccWwVGIRPZdBzkd
         ECKSVp3cfXXoonXW4/56QYHlGogBg2R+hhAEQRIcFG8p5Z42Md6vw7QNv6QsiXq4jW3h
         EUkR2+sSHGbruzBcdte2J+7bCcr+S82ylmlsoNLqBMEwdol4LUXvuDOQL7QiP3D/K3RW
         kpzWwvQyLN6XvXMwAptULhCojwZKfAL6vK4HXwyY+mNzbFg/4Qw4R4VHdtui2MnZjmFJ
         5KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596743; x=1789201543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4JWIpadkBBtpyHMGkKKLMv6w38PE5gnqdnr/RtDlQw=;
        b=KgoHJnwIqfDOnAgUuM9XBP0jQZpKzY+0murH3tXgKMuorbjQ4V08WL3pP9PdybpMU7
         vtVhthV3hRIZcl9aGDaaUnpNNJRyk3sDQaL1nUwYvHBlXMA7GZzRwiwVE15EeJGeMfRG
         0MC4qLR+rbvkWbDwgWBz4JRAeC3Pgu1qU4c9NGb0tstxtzWS1VCYdtiCRjEUEDwL45/0
         7U99Db3ANLJ8dOKcNCBb7QTmX3FPBgbZRGNywxlawWUMC+n6Q4jbaXak75Rl9J6ORdQo
         Z6fadoh8Bplefxzv8myFqk7jDCCCNd5DNF+a7t1ttNsVY1r8qV/VflboJw/EyHoJ/ZKO
         NmyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+IaXaMPytNNNo3eTiMTASKmrcnohw84q0hWhxgTArvTAP0AfJ2of7j/k16E1/1LxgwbritVG+AAp9ahnepb3+@lists.infradead.org
X-Gm-Message-State: AFuF++l+vp5BX7EepxRHiZSpnu0QN3z1X94gWUd2NOaeHjsTovfCXtJr
	M52ogIwCr8Fibr719+K9MUTS4Mkr/3PJjAT5DHBr3hxAqEpaOJjYHezz
X-Gm-Gg: AYBFou0YAPaTWGEaf6cZVs33vqoeQhbxOcch35r0EwkqMiSxDBmpgEJyNrlqos9I5si
	Tr/oztoJdMf1TIx3YIZiXfDvtfu0FCSY3P8egWCNJb4YcAT/FTdsbGq/2/kUSpr50Z8hnh+K157
	WHz41HLiqnGp7fOvleRB3ABEJYq7lkrOzzdztX5Mz5HpHyKncbYcjFE4ajdO2Ayb4tFDn4SOqMC
	n5TG8IxOcER5RwJhlhs4BtV/ysTAkb9D0rQTz1TG+R/5xTs4k8B7bNX/1uhOikx4oShid2EscYB
	4bXCMHZdd6eQVXURFAJf0PxzIfUShwdxvGacBFWJ/UQvrKccc6VrQU0uZDj7GEnWQQZdF1Ayno0
	Yn4sEUIkckAUQ57jqnwdiPrkMk3sVvSp2HVOy8Vrd9QakuAB7yIXU1PkxWWqoKBK8jwvkhCSRaw
	JNNVg3caJMUVIAO3lglbvh9tl0AkhWRjBnPWvQ4FzZ7oA69g12KsgSBXRWdCH6povYbXEqsfai2
	Hm/1w==
X-Received: by 2002:a17:90b:17d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39b26298ba1mr15383737a91.23.1788596743161;
        Sat, 05 Sep 2026 01:25:43 -0700 (PDT)
Received: from [192.168.1.107] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm14262328eec.1.2026.09.05.01.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 01:25:42 -0700 (PDT)
Message-ID: <4e65ef39-cf1b-49d4-a899-da36acb442c2@gmail.com>
Date: Sat, 5 Sep 2026 16:25:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8140 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org
References: <20260904-apple-a18-pro-initial-devicetrees-v1-0-0c25401d165d@cyberchaos.dev>
 <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260904-apple-a18-pro-initial-devicetrees-v1-4-0c25401d165d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_012546_041377_DD07F8FD 
X-CRM114-Status: GOOD (  13.65  )
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


Yureka Lilian 於 2026/9/5 凌晨3:49 寫道:
> The Apple t8140 (A18 Pro) SoC uses an AIC3 as interrupt controller, same as
> the M1-M4 SoCs.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index 1cb886785173..e3cadc5ad39d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -46,6 +46,7 @@ properties:
>                - apple,t6030-aic3
>                - apple,t6031-aic3
>                - apple,t8132-aic3
> +              - apple,t8140-aic3

the title should be "... Add t8140 compatible" describing the hardware corresponding
to the added compatible since the compatible being added is not "apple,t8140".

(Alternatively, if you mention the compatible in title, say "...Add apple,t8140-aic3" as
"compatible" is already implied)


>            - const: apple,t8122-aic3
>        - const: apple,t8122-aic3
>  
>


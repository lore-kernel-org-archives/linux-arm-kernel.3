Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC70CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=; b=QT4LFlUORKFx5fJ1e8JwwEivMx
	Qi5xJ2RAMV9xexRixvcHhjVzjYRM4oJ6udexCrufPmy1spGLmW555oe1HyDCQd76a7PsIeG9pdx2G
	Wo0ON414oYm0GBIWFBPWY2C7omlWvomwyQ+cufajpSEubVsud/OBNA1hDHAMOCielZDLIiCjLvkM3
	6QC17y0lPJvyftHHhGqGnm4dB7CSAKfi3vwcy6wXAn1LZgFiOoRVT61D/oSLrvGrw2JYJ5bxAQddW
	mj642P0gRQfurX6alca76Op1IfPpEgCF78QYx81RJwwIi2hAfXuiLbMO3Y1MF/+MTfBzSkXZraHw6
	NeRFk4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLS99-00000007UeE-0H7V;
	Fri, 08 May 2026 20:50:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLS94-00000007UdR-2Uo4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 20:50:05 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-67c9616b4feso3605989a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778273400; cv=none;
        d=google.com; s=arc-20240605;
        b=XrhFMVL5tSV0syq1qLJCu5qFhB2w4Azimni+CgaVYxUSNCR8KkLqXaSpvKNjKGcRdX
         vwZtpY6TDSc9WjfVUltfroDfs1AxP2N4yXa14IyVoYmfM1QtFBELq+By3fohmYkoiVoJ
         OeyO3QUSG2Tbk1C1nTirwNZ+EmAW14SR0Kev+/AF4Yl/EnMsg8jK1Lcb3iISc/SXQqFy
         D5/oJMGDkuWF0D7vsz9sw141lLi4PLSlUIvIevS1g0T8P81gY8YjzkYmFbDGgE0/dEfu
         2RLeXUBcpJc28nwssNovjf8QOzBGoxJ3lFpk1dD/5CW8QMuGmAqzQFOM4kDq1+7A3F2m
         KXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        fh=jESzJzRDlNxQKNIrzXN1LYO1CSF8E0mVk3juX7EpSs8=;
        b=fy8yhGXk91uOvL39pmNhoiQkjGW6sFOeuRYGDguqk5oQllItcq2K7nvh1pzLWWh4rM
         LmH2WoFmz7gO/2I4HqI++78oRCPXRBlxyxxGSXNb36amZcuEo4DKnybFmyS1PRtrqXkH
         vpaf++G6d2E64W9trv7L2DqPQaQyjQtcjs5W/LkTnMGJmKSNF02QK/azzFc3Jo3ZzMo/
         dHshbfLzEjpURHCcW648oFMojrw8RpkNf7CnTiQcBXF1qKET4NksdMI20SYU2i52ozmN
         mSBN93QK+hFbJ+TiqPEJfMs2WGRPVAVosG+uMg38Y9ppCF3u3lPWS1JOqDMeEet78EFk
         D9Vg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778273400; x=1778878200; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=bGZYDNZ5sJHu57Pds76iea27DOrLugRpQKKOKFcdPZlagae2lpTMWhgtcs3NMvqkF0
         S+5j/lozRoN6rM1afnymlWvMFlfjaDjLj9SoFVrWuS1neuG/aRrL5mGFO2avA59SuRWj
         Sy2BKi+v+4y4S6pIq7uhTB5Yl8ro3ugVj/CLvEl7DnT1tRSkf1MEnNMzIt4jOoRwH4EQ
         vtEzxQZvDSncKs6inKgk5QRVnLSKu14+nzwo17GO7YcvsgrbyrZ8+O561ITTOUTMynMV
         rZYw8j/U8X/3zlm+O4WxHI+fk0pQRIqq7B9POuIFUvefbwB12gKbqIBGIm2zCdW42N25
         jU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778273400; x=1778878200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zh/wQFPQhzkWv9+w9rGw8P4xXokXo+IJUUz/nVEgQFQ=;
        b=KGPEbiw/orarFyA2vCZHEhWT0dBt43kmsSUIPepeG7I/cjOrK6989jGxz8KzAnd7n7
         MwSPZ3giHaqK3EDz8bno2QxvHU5DjrC4GcnWUXQoljv2Rn+6TkdcNprok9QgqUwaqpAn
         qcilZRpBwtRmUmf3aXl0uAuCw1hbIGzgmnShUyOIQRA0akJbD8M0Mdy6Z07a5NfojVx1
         7N/O98RwUH3bKzPT/yjfHHkCkar0abMkh6FVZ2mwFtZUx8EtTa2bRDPZSEpno5w3AgDz
         vz9om58UJLGIv3tYdLQPIxUXSI4K9PtXfNcAQZyXC/uMMq5T2yFRnNCFGGR0J3B/PowQ
         1zOA==
X-Forwarded-Encrypted: i=1; AFNElJ/SUV8BLytKeLV2ZN4VRIocRIyuevWFSNfq6jQzI6O7cln6SOOPkoOVZ9TisMcOojVQctGBAwCAxAPKFOtFJjyc@lists.infradead.org
X-Gm-Message-State: AOJu0YwQwhxOkI5uhZfL1WIWWFOaPis3ELqu1mo4hyQSCDVZ8vbWrF2E
	Ql0G3DB0/n7W6qYZp/nB7SVelNKCTfhVTUTLpjjxD08LqSSU8xOlHqIoIv9LWwm6CUIlFb0gKNj
	dQ/uDV/+2bLFnnIVRVF1vyHxUV2tSLQxuoMed76DZnw==
X-Gm-Gg: Acq92OHp9hzC9/scD4lHUpDtRnkFyD2Sh8eOQ0en39W/Jq7ZMHnHns12FKuVpfR8gCy
	o4yin97Wv7yyzr0N3hUMbpwONB5L6mWwI+nprGB1EgT0ApEluTcwUxcTBDPGe2mCxEz+2XvCuzt
	gh6XHEdGQdrAijh05W3W/K0SRRiK/db4gQg+RAkhNpNsWATp3+mIf1eNkt9+NPDDTSjhHY2IKxU
	xwRP8LPraKbMmRLjRTlx+eUr6wFeH01CWBQDB49oJj/xynHA0qIv54b3HzzXXqUN1wHJA7IFpKs
	3H0dXmvBsukdXYF6oUaQ8t3cnNsdERPMjzl6G9W8sw==
X-Received: by 2002:aa7:dacd:0:b0:678:960d:cb34 with SMTP id
 4fb4d7f45d1cf-67d63d85428mr5050590a12.6.1778273400285; Fri, 08 May 2026
 13:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org> <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-2-fd6251d02a17@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 8 May 2026 21:49:48 +0100
X-Gm-Features: AVHnY4IaFcTZPm9giV6Jc_QJYDLmEM1tYy3GvJxgbZ4vj91rTyPTj-YVRCvMm3o
Message-ID: <CADrjBPoSiZU_BzXxQiU8unJNSqE8EFR1YPQe25rN7fhfLP2DqA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: soc: samsung: exynos-pmu: Require
 pmu-intr-gen-syscon for Exynos850
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_135002_660247_D89CBBFA 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, 30 Apr 2026 at 02:56, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Update the Exynos PMU schema to mandate the 'google,pmu-intr-gen-syscon'
> property for the 'samsung,exynos850-pmu' compatible so the driver can
> obtain the necessary syscon regmap.
>
> The Exynos850 PMU relies on a separate system controller block to handle
> interrupts generation, similar to the hardware design of the GS101
> SoC. To ensure the hardware is correctly described, this syscon phandle
> must be explicitly provided.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> index 76ce7e98c10f..6550c3736a3b 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
> @@ -182,6 +182,7 @@ allOf:
>            contains:
>              enum:
>                - google,gs101-pmu
> +              - samsung,exynos850-pmu
>      then:
>        required:
>          - google,pmu-intr-gen-syscon
>
> --
> 2.51.0
>


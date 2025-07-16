Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0033CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuHTPSN5ob/sxMMWugl2mb75NZygOdwpDw39+8JfWkw=; b=trz03wZUecmtHMG7yVmVsaCB2s
	7Y5LXjd/8crETAsca9eeOCf1b4Bu36bGhhUg3jB8chdKwba1Uz4YZujbbK0kfNmb2ThLoVbT1dCnf
	vy8tfu4+bVOX5pUvqMkYvnKlGndSMYKr7PHjenx9EKxBO1k+CafWBB1fNzgyJjaKX51G4uIRAwUNr
	CGS/ykncvZzBvPXSOzrNMGLtZAsIYaw3PWOK9svgW29h2kGcFQ8p0MCYi79RRDAyEBkMfcZObjtT5
	IjEhfvXu/ZqNhx0Rjmxmu4cSJlTg5P5kdD/0TLDibK1STJarNV/Zj5BD1nyZoNEIJr4YadhsIU8sJ
	HDP1nmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc38Y-00000007uFY-0NVt;
	Wed, 16 Jul 2025 14:29:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc31Y-00000007tHA-1dt6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:22:21 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-236192f8770so6303175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752675735; x=1753280535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuHTPSN5ob/sxMMWugl2mb75NZygOdwpDw39+8JfWkw=;
        b=kRrZqT+4nopQhA5IKhCY3T6n7njAEZTRFe/GwfEATzqY1eRUFudTHmCm7lgzphNkg1
         0ow8gWOC69eJKd0K2vNctCAJoMepFeq9GOvELUemdbx+snb8j2K9+J64/W7IhH2KU6G9
         LTKjCnWs24AC1NJyoz3cNaRzw5VuP80VOteH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752675735; x=1753280535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuHTPSN5ob/sxMMWugl2mb75NZygOdwpDw39+8JfWkw=;
        b=H8YWzdM1JC3uL1o42Vb8WBBQr60vYJ5pv6JX1qoMd0cvruS9ggexQKiPnFXe3Q/4P0
         R1DwElYNSC1De6EbSth94xbN+s+tsAe17Qo3bZKhMY3Lxuq0oOivqO46KWxbB9uiH1PH
         oeYAWj/TY/PIYI1ypyD0WvA9TRDwxJkbP4DL5KVfuiI+9NQ0OH0oJ1hnXKYZJunKWHpL
         NP7yY2KO/kJQLcwVL3BxP/t5CFn5aG1jnV8pdj0E5py/81VujgyuKEVpQH5CutLljHHt
         VCRe9XTp4X/fiN+cu4CDsFUwDhW1rtd8naAxm0G1cOkNnUq4efbvOh/6E08dcBo/PWGc
         DxPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxpMNRp10sANOKZyeVQN4R13zZBkMeaZx4pHigJ02bUYyxNQ3L1CHJq8h1T3DjXWWDLKCjEghGRdJ7ZXQO5mcU@lists.infradead.org
X-Gm-Message-State: AOJu0YxH9WFIkBDbdYM/rne24gdjGzgPkZjpOFsIziQipaY2jy5DH6EG
	Ey2tacNqSpyUnxJFugWJpFYpM1ONzJXKyfErV1Q7LUIPVU6RHryFaY3I9RvbqABvbaNiqnxN9lX
	WgJs=
X-Gm-Gg: ASbGncujKqGOdwv/yyqTQ6ICahudc3O5Rd6Blp6KXi89kA3CLAsPKWwDpj89sZed5qH
	7yDpBR/Ig9jENgWiu7k507GKaXQjYLWLwDKcun8Ix9y70FrCxr60SQS1UP65zC+faQG3gftqmge
	kArl7vYqRonu+Dzls8rvTAIAhXvb1T1CLaF5DP38ov6elm8fyA631ERwoA0vPqq7/q2QLYtsMlZ
	Qi+qQyMNvrabwa5OkgRzZ1WcAr1NRI9qaS7Pm3bMJ4KBaVhnIttjwqc2OMFbmo8w6YqmXCAElsZ
	um3M4fm2cPdnWD0RFC2TqTgNtzmYyCM0UfF44Hi+bkaGHyo7wWCi1mgNg2BX1eykx9FQJtDKcPq
	akCNHC+VlDC1T+dXz95WselDL6cCYEYHETUF2+OD22bT5v4gQ8SpP2WDpMg1Kzw==
X-Google-Smtp-Source: AGHT+IFmx4IvnUoLFP+LQxh6jrNZExmM6NL3plvJZRLSmoI5sd58MpukXxPzYPStXrEfKd/JVL4rPg==
X-Received: by 2002:a17:902:db0c:b0:23c:7b55:d051 with SMTP id d9443c01a7336-23e24b19c72mr62373185ad.14.1752675735063;
        Wed, 16 Jul 2025 07:22:15 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4323f0asm131363135ad.115.2025.07.16.07.22.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:22:07 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31329098ae8so825993a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 07:22:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUYJr/tOnIO5Er+T1377PrIA3Bh1FqqoF34rXHt6W2S782TtmM9L44j4/wSYojEsCrtkiRgqd+1faDjLwuUrdX@lists.infradead.org
X-Received: by 2002:a17:90b:3e45:b0:310:c8ec:4192 with SMTP id
 98e67ed59e1d1-31c8f9bab05mr11330150a91.10.1752675724138; Wed, 16 Jul 2025
 07:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-3-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:21:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
X-Gm-Features: Ac12FXxTIFX6vNFTUbNM5dNMu4K5yloNK1nFrEKpkxnVSSYFOEXl7o-QWsvciQ8
Message-ID: <CAD=FV=XmwiA_gX9pF5Dja1vezson7f21WHC8u8+Rhg_6OUJ+rw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: arm-smmu: Remove sdm845-cheza
 specific entry
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_072220_429041_13DCAF54 
X-CRM114-Status: GOOD (  17.98  )
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

Hi,

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The firmware on SDM845-based Cheza boards did not provide the same
> level of feature support for SMMUs (particularly around the Adreno
> GPU integration).
>
> Now that Cheza is being removed from the kernel (almost none exist at
> this point in time), retire the entry as well.
>
> Most notably, it's not being marked as deprecated instead, as there is
> no indication that any more of those ~7 year old devboards will be
> built.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docu=
mentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 7b9d5507d6ccd6b845a57eeae59fe80ba75cc652..646814ec7d15f6d8a0136de73=
b7eaddae232ea64 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -132,10 +132,6 @@ properties:
>                - qcom,sm7150-smmu-v2
>            - const: qcom,adreno-smmu
>            - const: qcom,smmu-v2
> -      - description: Qcom Adreno GPUs on Google Cheza platform
> -        items:
> -          - const: qcom,sdm845-smmu-v2
> -          - const: qcom,smmu-v2

The code supporting this can also be removed then, right?

drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:     { .compatible =3D
"qcom,sdm845-smmu-v2", .data =3D &qcom_smmu_v2_data },

Reviewed-by: Douglas Anderson <dianders@chromium.org>


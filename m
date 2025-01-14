Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC842E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmWlR4cF+mPlvD/SKofAb59V+xFfrfDkiiQN2ULLVu8=; b=gPJERcFZ7Qhb/ew4Fa7Py2vYaM
	aafKyj+mApoQGU/hihsMxuiv8XBpDsMCwJAzyOeV7Vh4jAdZdAgX75JlLehmx+UMRCEVRhQ9iKqGb
	CBfUP1OjI/naDefnzBMvLX8+pUTJMuglJZnQzmbpcIkHoLjFLSd+NNmLMetdLmdFw+BTchO48zrGO
	2rHo4SSE9Y2oKNzH/Wd6YaEOfCO8X4DkBmylwRgEgJfYBt1uOBcGAOvVInXn6YHn2tmFaTd4Z+trG
	QnRfAulaHDGl1JTQZ+f8qbSMcU0u/D5BsReLM2bGe8Ok+koB19T1FlFZjUCowEZ7Y/c0gWqOJerT8
	fevdb+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXn30-00000009bP3-0pxO;
	Tue, 14 Jan 2025 19:57:58 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXn1j-00000009bGD-1DSV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:56:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436345cc17bso42761505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736884597; x=1737489397; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OmWlR4cF+mPlvD/SKofAb59V+xFfrfDkiiQN2ULLVu8=;
        b=pK59NrAxu0ttPf5noSwP5x8Ok+VUvXbntTz1z/U5Bzd6McHrtk/wXHHjvJX50EiHSb
         UE5Bp9ayQCuNFc2EoYe+DSFsfEW/KQgyrIV780Hiuw7yNSrNx+6zOced3RfQjjw+NVEi
         PMGSmotEDclfzavdXCDAge0GUVw+h0wVDpogkBMpSdki9H8Yw7UoDCLTaj+jswY34yT2
         gged4wgM00vBmjP/kdikhvhRyVyADmIFkx9DVmKt/iECyA2q3+2UaTECmSdZdzgJy6IB
         +uZENq1HRnSSO6Gfjoc2VFITyS47MDhUKA0Nad74NwlzIs3KK2/i3jK5BKUpV9dXZ6Ml
         ADWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736884597; x=1737489397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmWlR4cF+mPlvD/SKofAb59V+xFfrfDkiiQN2ULLVu8=;
        b=bGj5SqAZ7MAfLSHCDcKqgOu8t0U+h72ZPZTuGPcT7L5i0+oiOFVtdZ08eNKGNJPSLJ
         eoJTeW3sTXW0o1labq45oEC1qgbgWWT6ks0h8DrFnia1fDD/FoRm2e6JWEyXOpLjnUaF
         /D6SBloqR4o2TWWKRCHiA26c1xzD4rDrhRmC6Jqidt5b3Xin1WdLNgFKuh6JYgBSUuy9
         wCTU6egILrSaC8m/yntsOn4uE+sMcZnvq0va1UkIGN6PAXQcEgEhHKL0jEwYRcL2OmI4
         vyNlZ7ZsJgRIX9rO89RSAGoeNlhL3qA68bU7qm3yQyichSlNNzPO2/NM5GkCJx/bZGGd
         g7+g==
X-Forwarded-Encrypted: i=1; AJvYcCVEgR8WkUf8qB/SuxmNYvjvApXkxu6tayo/OClrz6gUQcalUvWenrwRc1Y6NqRgMpF87NWnBg9vW0yZLT6znVBR@lists.infradead.org
X-Gm-Message-State: AOJu0YzMR4z9c2EZFmN6/hlK0MQN4c01UsXo6dALfBs2YmwzeBSq0hHc
	n+zO35dOebvQY7+t0HEe4A/OfonU1P7CLTxTS/ECY/Y0V8DC2uN4J1DslQBQy0c=
X-Gm-Gg: ASbGncs51st/qFpKvjuopnkUS3OrZCj6auktQolB0vbakGDUHCc10Kj+Gx4BkhIq1hB
	0AKLEROlK4dNTXulniy4px/F0CcA7FL1hwZ9sqosOB7vW9r5b/9KkanhHKQkSRtTPlxeayH6OfR
	mVfhgfLyC5dI1Y4ZGb3dPIRvSzOFWyPCAKd2sesnS7bdtOmudde1s6LG0IF+bl1cwUeyQ91xayy
	fev7jeiC0J7ifI4eTp/jiNkiGb6/VII60xuKSVTN0BG8/tJHYofnLoBNkNb
X-Google-Smtp-Source: AGHT+IGQouXUOO+qEb5G2vSRcAAdIKYNRk9bOvvSttjkX7QyY7z4FXFdlG3d/Ksq2SBLmY2mxOAH8w==
X-Received: by 2002:a05:6000:1f88:b0:38a:615c:8223 with SMTP id ffacd0b85a97d-38a872f69c7mr22826797f8f.10.1736884597362;
        Tue, 14 Jan 2025 11:56:37 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm5275313f8f.43.2025.01.14.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:56:36 -0800 (PST)
Message-ID: <13a3fdb675baa36fcda1bb254b05032b1175a2a8.camel@linaro.org>
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Tue, 14 Jan 2025 19:56:35 +0000
In-Reply-To: <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
	 <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_115639_330940_72DBE467 
X-CRM114-Status: GOOD (  14.52  )
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

Hi Bart,

On Tue, 2025-01-14 at 09:55 -0800, Bart Van Assche wrote:
> On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
> > +/**
> > + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host and
> > + *				=C2=A0=C2=A0 thereby the Host Bus Adapter (HBA)
> > + * @host: pointer to SCSI host
> > + */
> > +static void ufshcd_scsi_host_put_callback(void *host)
> > +{
> > +	scsi_host_put(host);
> > +}
>=20
> Please rename ufshcd_scsi_host_put_callback() such that the function=20
> name makes clear when this function is called instead of what the=20
> function does.

Would you have a suggestion for such a name? Something like
ufshcd_driver_release_action()?

Unless I'm misunderstanding you, I believe most drivers use
a function name that says what the function does, e.g.
dell_wmi_ddv_debugfs_remove (just as a completely random
example out of many).

If going by when it is called and if applying this principle
throughout ufshcd, then there can only ever be one such
function in ufshcd, as all devm_add_action() callback actions
happen at driver release, which surely isn't what you mean.

You probably meant something different?

Cheers,
Andre'



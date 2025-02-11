Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45547C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=; b=IGGJKCIr+TfxgWku0tupMk2Pj7
	uBJbGlj4VarUiBBSD3n0YUAmo9wfTcGolaVZtYkxi6eUMDfMIyqO/RilKK0NlfFihoR8Kuvl/HWbS
	n2iptZKmtRTFlaYyIv8ob7DA4k68Rm5WMerg9BThkUXP5aAypq9pZT8yllL1kcsG69ng1od7Sxm8j
	pN+6U9sEanD4eAV8w0WUUEGl9HzZ96qAUan5WpFlYrURi+zqaaN0TxyOrxtRRHJuHIFb8J1sH82k5
	9BwJiNtVump2MQevflv/iRBQ1O1r0b4Wt3MMdKeHtL55rfVdBncocPdnlykyJscE4RV0LQvkuaGc9
	0TUj1EHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqI2-00000003wWX-3fhV;
	Tue, 11 Feb 2025 13:27:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpwh-00000003scJ-0BQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:05:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21f53ad05a0so66449945ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739279097; x=1739883897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=Dn7VsNhK8WFsNJcbV7a4fMTUgZpOKYAwg5reguLf2ajllt7L8rPk1X9YtHwqTlHwy1
         TOz8jLgrL+ORYi5nsOn1uORIqFhEFqT3dxv7ig44RnA4RQ2G+c6ZiwU1EQbh/HefdfFp
         57sDc1c6W0slzxIhn+dZCBG63Torwb8c5BfpVzkGaNHSFe4XdAzq+oMYM5RirLlHNkMv
         3C2kL9ecy0RlXE6Pt0hl5itwwnjzW5GZxBcFZimZrr70bvLtGyVhXzWXtmGwei41pXe9
         xl9zjDO7w1Sf0LbKihrjN32qhDvmSAMWZa1c8Amr8XyvWfgD6v9v2D81Tlrho1JErW36
         mzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279097; x=1739883897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=o7l0GKJ9GlUbk9GHqbMlF1uOB07jN90aXsyip/rPNRg51ny3ePF/bt0OMSU4NHZeQF
         qCUeGTXMgGXk7/aU1fd6DhlAAFAEVMcOnHOHtVMPZF4oDBL0oaKeQsW0jJ3XnHwYMGKT
         O9TOPM8EFDQhE4s/fJpWJQooxKSHoCF+/TBr3ckwLwzxIWD+xvsvdCwa4xNcbWQLZg8K
         EZ27sS09/wDP4QnpPO55yA6/Kzg2n/RmLTzdZJyC8540r+ZIcdZT+cirWmJnDZyBMxi8
         1UDsH+ev8tPflE1VM0nB6Il1s+S3UVSyhPKvIeSagHROnFxpCH+LcJLYnOaFUFdEVk5C
         jhiw==
X-Forwarded-Encrypted: i=1; AJvYcCULSHie+HI6WDa7NToxaAJUpCJFLCAWehqMgmIKMVm9xFHysk5gUDK16arSTGYzakSJRQLgpd3ABvLcoQA0sUPR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0AJ5DTapBvrGibwXXBPDk6o1ZurJdmMOIPv9JCwmctZzueGLj
	SzYCp7LWDsXjNkdHZUS+3HRGqrW1a5r5Bq3QqM3sS0kuv7PDKsjTeluOwx21oesGj1X9/PJtQ4G
	tyOwXSJVZiNfFS98x0D7Bqxsl8FfyXSDx
X-Gm-Gg: ASbGnctFLDRKN+dovD0DrZNzuuJL0vKSwqv0oKWET7WEDigC+IdK3f18zVc35l6cPis
	q5eJ7At7hfB5XBNVtkA2U1T08sBR7OTGslyqgiIDPMAhCTGE6NJIRB/zJZLGj/WzDHWmhSg==
X-Google-Smtp-Source: AGHT+IHxrSbz+UMf0ZSE5PZbnCLY0l+6wu1dbGZuTcxLw9cyD1B/2N0NzHUPXxohK81nTZucVVt76ckOaeCaUTE/ZDI=
X-Received: by 2002:a17:90b:2545:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2fa9ed5d37bmr5548858a91.2.1739279097573; Tue, 11 Feb 2025
 05:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Feb 2025 15:06:26 +0200
X-Gm-Features: AWEUYZkxR9jtS8NDetBx_vRl7m1cPQuJxMC1s9IXybxI-_qoyigAvbqfYgvFG70
Message-ID: <CAEnQRZDC+mQ=QzzpBsXzt0kSSDAo-LbfRkbDLfxrbxW9Nse-+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_050459_080380_4DA1CE1F 
X-CRM114-Status: GOOD (  10.39  )
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

On Tue, Feb 11, 2025 at 5:58=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
>
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
>
>  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
>  sound/soc/fsl/imx-card.c                                  | 5 +++++
>  2 files changed, 13 insertions(+)

For entire patchseries,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


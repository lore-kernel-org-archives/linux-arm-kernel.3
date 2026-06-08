Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2807ECD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=; b=i/1JULe1M4S19q
	SoQVA02A3MaFksokQhRB/zKlFt6WSuCuMmDYBP7AaN3sgshSAm8f7YRrW4uSNjYgVMXdEQJzpHB/r
	OTgP7Xkra3zGrhrbN4VGua7ELYdd6XR7433z2EkkprD2xTQ7T6+ydlXenpRQHZfji7Dn+qdWNwhpC
	TA4IAtlUMLytsDZG57+tCczxdMq1/7l/gi2BTtkheB4lx0r2+d/dYUZ1mMVAY3Zod4xKMKc/2RO3M
	/58E463saj/5jRETEf+huDWcPN1Y7rzPgkevSPlZiVfzFU2jCxPj8VI2Sbk9Bmb+boncA3aSL/eDO
	ptABm7Zn39IGQ9lsm4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCg-00000003duL-06zI;
	Mon, 08 Jun 2026 13:39:46 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCd-00000003dtw-3UwD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:39:44 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-30749947917so762610eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925982; x=1781530782; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=L2n3PhuXVrGle3LJku2yFsp0YhqwmcYVfDfjOfbdsH22G0qjXE23slaUx2OVZGWan6
         vI/S8h7W7Q4F4mB6Lxsk7X7VR7gF9Sw8ZD7lsIfrOF4vLt4vRqeNQ47XptJiGoZd6Fxg
         0Q6J4mul8vaFOFP8Jsx3kf8XtzVVGoMgIwQjR22Vt6bozDSJXUflQ/MMclPCK+jzosbG
         tcoSa7fxsh4QSjI6kVaJsfXETup8FlICw5Xjz+DNbj6/iDQbsBtcSOFjvCUbZ2wi3K6N
         QCAvSz8HopTE9rTJZppZaBeGN1HcIY4Hfk+0QeKXOp+AZMfe5uIxibZtpx4ZA1CkKTZ+
         nriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925982; x=1781530782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnPr0God56443aVBHA2GEm21wYZNNjULBNiCWm5g3cg=;
        b=ldt8JCCGsCYrjeDidKM+5t2STnT0M3ZJVUkALkOmHERc/Pd4rMrEEQoVCp0rCFvOJF
         p9lcFwUVbUk7zgmrrdmN1e4DGEndU1L0B2PkgiQ/rQdSHWvluNPYfYD1LIrdCsUgtebc
         uaF6M0agB5a7mPD8Mkb4oVYoe4xio/AY2xgX6xBhZIt6PiLiAloCxKSFXP9FEieCl+Zr
         I4EcwBUa3kLjWz0n/hrSas+JmH0veWs98bp3xfI2yb8k3DLgGyL56ck05qUXlsLWhCFt
         zFCsCKpz2gy/NuYzysCb0KaBKMwZ4troxbU4fcsZR9qP87tEp22ieXaPMWNHwEvVslUY
         zcfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/gjFPWyhQQuN1XpdAgmRjSfsqP2IAiIhJ5etf5JMEL2MFPsmBZuvBdvZfnfSC4TLAbBOVuHM1jBX45p63/pAq@lists.infradead.org
X-Gm-Message-State: AOJu0Ywykz186xdxV80SxhtRBBKJtSeSTNtGTlKqklbQ7E6+t2yUskER
	JWZ/RFhIAEi9ZGubAd+aIbE6C3k3R9ZQEGrM5s3+yxzSHEG+kuM8rM+mJ7S23K3M
X-Gm-Gg: Acq92OEU/Gkjs8UVw7WgdM+Z0LlZamjYV2pQEQaWs/mScVwyfeU3OLz59jPkx32QJdC
	kMX6Tz50tCr1dD7bIXctcc2GWPwscAPhEQrykc/XLMATM+1KnDNXpAVCi5vH8fb4ZqKNTfiw3vW
	XS/CK3s90vETs1ribL5DKoUFWrntxTbWqB5bAB+QB8+9BT8Z1gMX2VLbcHHjo/FRFL+rUxY+i10
	0o9qAwx1n2G6fydCvL6b01TpNi2F5Yfp71uAPaMdwLUFcVKD/Sjo/zIoLyDiCY4OtOSF1YWFY1w
	O6MR33Py+zToPL3nnm+sWjCH0Qb32Drw0hr8aEcmWKrFvx4387fF5Dsn68JK1/Nq9nPb9I36Q46
	V9Z9MNKhu5Td3Vv2LDzCAxdJoxWZ4uZoKjoN4euX08k+rw4gHjQynF0l+0xQLzC7V60xU2Ifobw
	0oq6jSzKZnGiUUG5nKZINWEisCoYBAVxOFkM5MMV1LxTA5nomvyQYbxTnMsTcoI1y3otkxD+AQt
	bXRLu5dwoOw8+GWEgrAXpg=
X-Received: by 2002:a05:7300:134a:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-3077b357e08mr8719405eec.7.1780925982244;
        Mon, 08 Jun 2026 06:39:42 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:41 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/3] ASoC: use scoped OF node handling in manual cleanup
 paths
Date: Mon, 08 Jun 2026 10:39:10 -0300
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTuQphLRq4iLdPKrEUlCxkqh9
 O6Nunybt5KiRihdupUqPlFjTg39oSN5+HQHx9BM1lhnnOnZaxbOE6ccwCq5ILC84NNcOAwjhnC
 2J7gjtaFUTHH57dfb3zqPT8j7W9K27fe7jI5/AAAA
X-Change-ID: 20260601-asoc-of-node-scoped-cleanup-d3be3d927e64
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=C7dxKdcgfrcYjsHEoKJuUHkSmi5vz3fglU2QYjaF3mU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxwQnzt4WfWDffoev+vtuCZqdWzUp9H6gV9CW54d/7
 FH14zsU2FHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQATufyH4b9jiF7l3Ih1zPta
 2D3jXs60qw3Yw7HjVMCsY3eufWo4pa7H8M9g56/tC5oEE5myWILa59V1Oebwxm7e8PT34faaH0u
 MtjAAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_063943_874071_C80A5BC7 
X-CRM114-Status: UNSURE (   6.87  )
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

Some ASoC drivers still manually release child OF nodes
when leaving child-node iteration loops early.

Convert these focused cases to scoped OF node cleanup
so early returns and normal loop exits keep the same node
lifetime handling without explicit of_node_put() calls.

- Patch 1 updates qcom_snd_parse_of() to use
  for_each_available_child_of_node_scoped() for link nodes and
  __free(device_node) for temporary cpu/platform/codec child nodes.
- Patch 2 updates fsl_qmc_audio to use
  for_each_available_child_of_node_scoped() for DAI child-node parsing.
- Patch 3 updates cygnus-ssp to use
  for_each_available_child_of_node_scoped() for SSP child-node parsing.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (3):
      ASoC: qcom: common: use scoped OF node handling
      ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      ASoC: bcm: cygnus: use scoped child node loop

 sound/soc/bcm/cygnus-ssp.c    | 10 ++++-----
 sound/soc/fsl/fsl_qmc_audio.c |  7 ++-----
 sound/soc/qcom/common.c       | 47 ++++++++++++++-----------------------------
 3 files changed, 21 insertions(+), 43 deletions(-)

---
base-commit: 112b3b39550d94f94eb7e44fd865716835d9aab2

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5287C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=; b=otfIY1Gfe51C5hwPJWhQjqbFO4
	3mCPaTiyj9lSnIEiBeKTJ03jmBJazXVZSb43DYtdepFw1Y45P329+NuW9RKP8ymHVmt5nhL0PY1Mo
	mV7TwTnjovi/ELAkTpNa0ccVPqzOlXlYCR5Qyfdkwb+ayx6f39uLm6QrHWz57OxxYZYaqF7JOAhe+
	/kjCM5zc3aII1LYl1J6SnbMXCiFZpy+m6aFsRglXtAuY96wrDsaELSXa6W44GB39f95J55itR0bYw
	+qfYjnHuDh329ffrmYgIzl6Q8GWeupW4+oNZ2MUepGXD2aJlYZzEkifMImOD5VKda9ubhWpHBHONO
	SpZNyiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OvP-0000000Co6h-3vMQ;
	Wed, 09 Sep 2026 20:29:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4OvN-0000000Co5b-2owI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:29:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso61348485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985779; x=1789590579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=TBTCZBQVXY7o1z/k5lO6NKcH1fETaBAFpNw4/d98mEnKPGkp/+2D/1dO6bENuDCnuF
         AddhEXoPXAYaLBqvwcDgBQZ82lzOF9P3kFpgJyOzhdE3DdEZmA3O8GjrfyO9yyTuL05D
         cVGKXhrxlVbQJA7r8v8vauFrS6NBYpUDw5aQ5O5zxaSbX8fhhx1cfOwCqIQW4ufqhFbu
         bV1hAYCa+VelxVGYCqZwbpPuhEZa8m+HU8YdzzAFI2ndU/QMoPmWePkpz/KwDQ2LTJkb
         Ei3YLOQ83Q52ElxX12xxq3RbJwyTBBakdZVL4fabxuuL+pWrsP+5kSia6UyJAtZowStt
         ZNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985779; x=1789590579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=JGBExzjvAAN+9XV0NZZWK37404Gnr2ayHpqb2dZfgCs0Yc8LGxH8qikc+MdLMxopEm
         I0+JlUtAQOZMf6iU5SwQLsmda3QP94u6piqZ5VyPwYv+knpV91RsvH7OXqP4dDz7D6j1
         GFkhRtTCDX0JwRm/uxDHJhT/S6+iQc7iqgqy8goullKviN0GbUJDMO9DIDVTOUAtpuuV
         9KpBuRaxiRygEsKBR0asTKXBJk/pG9gP8gXfGMBwnnybxWncU1Byuvz+eqUoQM6E9oC7
         IHMMp4nhaTejF9U66ccBRCPxGbMSXhk8PfKx5Z2n9pZF20nTrS2ejAbDk9tfvjQ8VPP0
         bfgg==
X-Forwarded-Encrypted: i=1; AKwUvBwnyYNJYQtqV8wPWFrd70AslxRLZGlNQTsKOaN+iEcE18NxYpSeIt8f8Hk4Xjvukx9I23tiFhLF4qY9zWSiISEV@lists.infradead.org
X-Gm-Message-State: AFuF++lYllZaM525B0HGbbs0INrWhTEKhyEczf6tRwaXRnNoxCIXSIWw
	3jvAQy9ogZ5BSB0opADS1CECZ+uCtUbVxlmlhvqBjc0nC7ARUuDaucOu
X-Gm-Gg: AYBFou0gcEOrKmg6owjExcMpfv06ronn+Cf4vjrPMq+zlVAaBaAmDA4RwqOuiZQ3Cup
	ns6/GwsattZpiSFVslZh6zXO5As8J4SoXqpJOiTWofLZXh9m1UC3vMKWrZa3d+VAxkCDCWeCgxJ
	gCaQMuiif5AIsvCz/6FJpeFi2uPZxRVfXuc+PCtefZ56AwsaT5jgAjz7+5y/DwKz9e8QvloGqE2
	2OpsfWMCrZNEOzgWQtk6Y4xyRy16HOkdvkpjQT374LSUkHvuyrCcRR1upNmBjzWq4RQyr/PfBtg
	Kw4EuJL6zOAo94U4LFgR4vdeBT24lWNUHVUMKX6xy/bNp6FTjiSPpARJ260Ggo1Nd/Khyxd9Er5
	1HShsL+uItktutAWE80jH9V5gB01Tj/KH4fszoRGHdfnfL21W7PPe2yZdJ+lcWdM33Xu2rVbPZm
	2gsxKGn6eFgbAPRqaNELBk39FfJqv8jP3BNLfac+VqWxmtuBqe5sPrz2ZM4KzrE2aH3ufXsqhKc
	YGTaWm4b67iH2ePVDYXWYppq62jiVlLoU3TGaBmnYxROMPW9O7mwjsGoIuyf+OI8LMHv6skatG4
	hmgTVaJAT4H6CzinKye/MciLhJzYS002jv3RjRj76U5et4LOlN2rPmVZYunWw3Oqr1YBaOA2S4w
	oz6pZxX+6y+0oprBT
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr2796585e9.15.1788985778747;
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm16723565e9.0.2026.09.09.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: xtensa: prevent stack OOB read on DSP panic
Date: Wed,  9 Sep 2026 23:29:31 +0300
Message-ID: <20260909202934.37644-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_132941_722564_125ECF23 
X-CRM114-Status: GOOD (  11.86  )
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

This series fixes a stack out-of-bounds read affecting all platforms
that dump DSP oops/panic info via sof_print_oops_and_stack() (i.MX,
AMD, Intel atom/bdw/hda-dsp, MediaTek).

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a loop that walks the flexible array member ar[]
in struct sof_ipc_dsp_oops_xtensa, using plat_hdr.numaregs (a
firmware-supplied, unbounded count) as the element count. This only
works correctly for callers that allocate room for ar[], such as the
Intel IPC4 path. The IPC3 callers listed below allocate xoops on the
stack with no room for ar[], and were not updated when the loop was
added, so numaregs walks past the buffer.

Patch 1/2 fixes the i.MX handler (previously sent standalone; this v2
includes it in the series after an automated review pass flagged the
same pattern in five other handlers).

Patch 2/2 applies the identical fix to amd_get_registers(),
atom_get_registers(), bdw_get_registers(), hda_dsp_get_registers()
and mtk_adsp_get_registers().

Ștefan Ghețu (2):
  ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
  ASoC: SOF: Prevent stack OOB read in the remaining DSP panic dumps

 sound/soc/sof/amd/acp-common.c           | 1 +
 sound/soc/sof/imx/imx-common.c           | 1 +
 sound/soc/sof/intel/atom.c               | 1 +
 sound/soc/sof/intel/bdw.c                | 1 +
 sound/soc/sof/intel/hda-dsp.c            | 1 +
 sound/soc/sof/mediatek/mtk-adsp-common.c | 1 +
 6 files changed, 6 insertions(+)

-- 
2.53.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8FFCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 07:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=; b=f2p6M1HrnubBZTdGZOth99eXka
	8N29M9BXScXkhTW5MzTDTOFevMbKovA2qL9MG5qk+h49sOteVYM0ZfQrV0mB7dTcgEZeDpeGy6knW
	I6Jk0B4syf/55/bWh/57xWuRUEqF4LhTCXiMc+VMkr16uRtayUgOUOyEmbbfRruXmPy+l8HqU42wq
	dYuV0cfjPn8Xojy1hD2UDKaotemQMqf/vqY+J+GfWEGJ7AD6BKI4SEmHHjee4NMvTrsbm2gMTHuAM
	Os5J//NG6leyGBU04d8YxXuHyKmHrI8xpBvOVYQ58tTpz+bqun13xwjlRXvzPHfDudZ4tBiVwMNrZ
	ChevNolQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHLg-0000000DFpZ-36EN;
	Mon, 27 Oct 2025 07:09:01 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHLd-0000000DFoe-33zn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 07:08:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso2040585f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761548936; x=1762153736; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=XUmApBNmNg5rA8Ih7XshrXzIuN9HS05/LgYKdLE7iDtZSw58PEKiOkx82HL85i9uhL
         wGzWTKwIK04Q87e9i9kzYJ7vCAks5MEFYjdttboVzaiCGZdylPFokILL1iO9X3/8ezBB
         ZMb7H/VdxC9tOOKbCMUTXr5aI7jnizShNhH+5Yv9FzRIZ5KZH+m68BszHnVjmFANVNas
         gduJz+vm16K/zR9QYV4/FM2/DrtU7Y2dlz7dlNWKobPuRefe/O2eHVF89A4lNGfMY0M3
         p9iknlpvFPHVhWle2sw4jEpRCzLrL8s5t5PE8DuPLQFiod5ajlcGtiRR0hYppeyFYrwQ
         bv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761548936; x=1762153736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=Ceaj9s6MV0eqHyE/1iV7UnHx05iAdQAzTeoM6nG7bcZhz3Bebd0thIpXR0pt3vrSrt
         D0MakV9HfSmBGGXGbVaAWmCeVUEK7wwlw7FFMKVPFxFtSGPm/bx3W/Tf4JGAR0NIAuwU
         cWBqM4e7pVAwR7TlI3Tadr9+aX/CPPdU4aGpJ3cnaoCJB0Ft3+bNrJw4/7MuZjATtHsN
         T+3bMbrJSB5Aq2W+x6U1bWCtBzHzynGrIlyU3lnWFWYHpznEe0PyL/EH4hfo01KoxaYw
         QAZE1cv2LfdQ9zo1u1AR5q+WjesZ6tKbvb1DRjRwP0tnyp1hwgMoSfQN6YRjeQN73ud+
         Y2og==
X-Forwarded-Encrypted: i=1; AJvYcCX+CInpDgOMNNEO0noJ2R3l/vgJt7OgYP7LoJIhX2Tog6vu3UZ64xpLo9XJ7oHYkioT46tKS+LRlbQpx6oT1/L2@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSlZsKmPNfEKLPrkSZVKyyAvkF0ajzECO6jAgxDlyRHsGBhuS
	ZxRUUO5sOWpXOkOfsN4SedlNMIS7Uksm5UeUJBoR81luQVzXyaQq37FVxcRnGhAz2K4=
X-Gm-Gg: ASbGnct6ZlT2+0OI2KSapXI23ly9kEQLi9/frxv488WsUKZq0kKuHHoSOFDLP1bOQYX
	Ci3VAzI54caebEcqskmu4ioE5g+DACyWxSeC7i55hQQqiOGqAYxLvbKZQSX2znJPanjX9TQC9jJ
	mUoyDxDU73hnN68EcMVB7kyyfwaK/QCEcPYBnQssaTiPF4zB7SXMx+aTdIS0INyNUqqNeKqLz1Y
	CIizA4lCCBJLVL9sDcAHg/KzJaZgRkpMUQIGXcNajuzWB2UqdZO7qPas6dxe1hap6eOWh3c72Hk
	FSs3EWY6Q7yYdUq622CYpdNmVfytIAB9AueKdJ8+DCoWeqWmi2JSCA0A9oZG4Bday4THFbenCpE
	TAcFRRjgmroyEPETwh06sdBTVonFDp8lwfei7lgqX0vay3iXppwoK22npM1iDHjs/BnNeaImwJ4
	T4jauw6zfu1kRO94q5
X-Google-Smtp-Source: AGHT+IGoQx8B5H77NlYFS00H5yXNOz5JUZs/694lcXu0yPBw3rKGoC7GgPX+DZXHN83AY89E6HX4rA==
X-Received: by 2002:a5d:5f82:0:b0:3ec:db87:e8fa with SMTP id ffacd0b85a97d-42704d768b6mr25913703f8f.26.1761548935732;
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952e3201sm12634747f8f.47.2025.10.27.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:08:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
Message-ID: <aP8agyKj73bLZrTQ@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_000857_816235_5AAF21E7 
X-CRM114-Status: GOOD (  16.24  )
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

The snprintf() calls here work but they have several minor style issues:

1) It uses ARRAY_SIZE() which is the number of elements in an array.
   Since were talking about char that works, but it's more common to
   use sizeof() which is the number of bytes.
2) The printf format is "%1d".  The "1" ensures we always print at
   least 1 character but since numbers all have at least 1 digit this
   can be removed.
3) The kernel implementation of snprintf() cannot return negative error
   codes.  Also these particular calls to snprintf() can't return zero
   and the code to handle that zero return is sort of questionable.
4) In the current kernel the only "core_id" we print is "0" but if it
   was more than 9 then the output would be truncated so GCC complains.
   Add an "a >= sizeof(scp_fw_file)" check for output which is too long.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: The v1 introduced a W=1 warning because of the truncation issue.
    It's a false positive because GCC assumes that "core_id" can be
    every possible value of int but actually it can only be zero.  And
    also generally, in the kernel, truncating is fine and it is fine
    here too.

    But let's use that as an opportunity to do more cleanups.

 drivers/remoteproc/mtk_scp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..db8fd045468d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
+	if (ret >= sizeof(scp_fw_file))
+		return ERR_PTR(-ENAMETOOLONG);
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0



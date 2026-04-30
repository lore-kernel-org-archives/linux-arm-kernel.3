Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=; b=KvBRYm5VRsSWkbLemhYwDJ27k7
	hGGUOeit4zKN0OoZkbmvsnCTMJdScbuAz0VPgZNmjQQDDfn2POYagmPZRHux+CNoLy2wZPU4EJUZh
	PcCwyBFx76RraSp+P/RSHqCCD8agdYGzaw7OpgzjqhMG08Kh1AX+Kd+IjV5F80PD0qlRQn3bGWSwq
	w0Ky7eCLAVVwXTzT3FQOPM6/aeak7Wy9iP0s0qoLsBtT/zpHED6f6YRFk93yrQguJc+tPOEreqCyT
	2r8qZB9B23NTnfvxwbjJO1EVNJs/cv29Mj6GnmD/BowIifLtaf0vzAeAt4M3TNPHTf6tKpJk7Z+8K
	CjRlGxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPxZ-00000005PNN-3dCs;
	Thu, 30 Apr 2026 11:53:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPxY-00000005PMj-1HZ0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 11:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=; b=JlwwZC81m6wnrLTZJlFzCa82lV
	ef6DSPxb6Ou2+mz4pCxwL/MEpLhXZt5FnJxTkgdCrFuMmO9atzyZ/Leg//4Z4jdbDEnQOrVYGsCDI
	IP2tHkxdD7Hkj8DTpESS7SPNXUSjzLed9O5DYzVZnnS3RNUocVzOyX9r6HrTQ1rVl8CDLLXENdcuk
	jiD/B/KvfFcxQ1rElW1oynKcq2bbFVkX/MJx3Hq5C9qjLwGDmQs2TzamYu4uTcURAvqbId9pI1nA5
	g++Qp+cv0oZ7obkS+rvg/FfwCVmwgHAdR6qmqiETgURvSJHkFecQEmAIHQwof+NLmOcxgMK5dA+j8
	lpP8v76Q==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPxU-00000007Ika-1Wi3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:53:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso4963755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 04:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777550010; x=1778154810; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=;
        b=A0ep2ELIUzIT2j6qrCMeZZLIKzGfdc6/LY4SgAuIcueZkjvcPEPBv4IyHPyIOHlPCP
         jW+rB25J1HX7ZUmSkHCQHySivd0i56DLv7ojHWLlDl7ZNrdCD9MXf0cRwFbLudFbtF1L
         c4ucrnNFLDZ02RiYkt9lcZmha3MQU+z2WcwVNMcB3Ji+kY84mDjqK8m68VPa/x0hzRW2
         thhnHnyV/Md3lVBHOnSjoRna++9iUsPrPyHLfm5ewPoqSV/DBxAmQlcfnm5MyYuK4m1k
         hoHNSaqJB3Y6ajqMrkCr78lk2gCPCkOOcTyn/D/eRi+/7deIuCaNdJlQ08VtHcxn14Xm
         8JfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550010; x=1778154810;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmgXHjLeIkbk+Rv0NJChDX5ZVnbAwfmHTE3lyoBocNY=;
        b=Qhzyyr8hAnYa7o+8ItRcpBrhu0GfeDPySMwtEdq5gJbJ8icQ9LdtMS1MZCawU1qVfD
         QSCtM7XjOd4DenMSzH7IUlMowxlRVNy+UepRL6Dm/Duz1htjVUGVcIRs/rS2uKPUkwjg
         Z2HleMdCdsxgjoxbykflnqmaTGLQ6zo8uhS9xC+tCOpTqRmDgBzwnFow2qbRhkoIqQMa
         F+O6XWDLiTPULuGkEozaPVS2GXbtanUMudWrJn5uZz8BPG9L5a8g5D2/tlCuYRCEA+PT
         Y6CN1uI8syWXpi4EfTIUKixu2OpEMmmxdMlk816fNHT0/7BiCYoGny/+ckvi8psr+yfZ
         jDYw==
X-Forwarded-Encrypted: i=1; AFNElJ+CqiZv4IL4HrQ6k0tJP29U27OBW27Aj7QKsN9e4OYsS/NDbnixEoteMngfS3X3J9qBWOymUlhEMnFb+f+Ok6TS@lists.infradead.org
X-Gm-Message-State: AOJu0YxctO8VoG9uqIzUL3TMc7/WiWaGBVF+v1bBJ+Pdb5XP5BcxvR/O
	XpsA8Y0/IpBOmW5YwLdfEs+D8dkprxwAas4r4QrpUWKUJZFUheUjjGK8pfpksv/W11A=
X-Gm-Gg: AeBDievBoYHS/UGeMwwoipau5o2uYrTwyQIbdZw6Q0mkJEbHxrZFiPB6QTf8lNwp4pT
	EaYRBhNdkZEyS1SkqZMszz1tfYuFkXkUqsVorB4wYS5wcJU0eAFzINAmuiUVg+Nd1JJKhdGnhIx
	93FoSWEup9ow89hLoJc4Qdc+YBmAJKin9YGcwtjc8OtmflphpFuS3gWvHY7rHW0oD0pB2OHB2Cc
	Io2wXhk9049kkUHmHKTgPyQ8PJleEyHNacXwnP1IfQMo1DbuEjODoniwx+WUVOCbtanXLd7suDT
	x5bqaOsaqJTntszv9m9b++7mIkbES2/TbbkWBtHI2LdCaKv7jVgJGTXyNmRWhwxI8+k3ZKoO9rO
	PiGSKAENRW4Hjz0wd2D7fPCz8mKd5RnkEycLXbBv7UB04S1TQCEJNRoti19HbXwtn3UP5C0Yvm4
	ieT44N4Z2CmxjXkaDu/xibu/IXbL6b9w+TdeccLnB4CMGS/7UcS/t9b0rGLtHrPhA7U//q4W7HR
	ixAZMqKsEYJbilXpQ3/3QF/h1GNkdc=
X-Received: by 2002:a05:600c:c117:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-48a844a1528mr30995585e9.0.1777550009764;
        Thu, 30 Apr 2026 04:53:29 -0700 (PDT)
Received: from ltux.linaro ([2a00:2381:fd67:101:9e61:b264:2b8d:1e57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3058e5sm40886905e9.16.2026.04.30.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 12:53:27 +0100
Subject: [PATCH] clk: samsung: exynos850: mark APM I3C clocks as critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-i3c-criticalclocks-v1-1-6e1fd8dfa21b@linaro.org>
X-B4-Tracking: v=1; b=H4sIALZC82kC/x3MSwqDMBAA0KvIrB2In1TpVaSLZBztoCQlI8Uiu
 XuDy7d5FygnYYVndUHir6jEUNDUFdDbhZVR5mJoTfswfWeQz1+IOlqD0hFSkkPI7bRH2hRnct4
 Po18a20MpPokXOe9+euX8BwC6cFluAAAA
X-Change-ID: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Brian Masney <bmasney@redhat.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_125332_573798_6332CE9C 
X-CRM114-Status: GOOD (  12.20  )
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

The Exynos850 APM co-processor relies on the I3C bus to communicate with
the PMIC. Currently, there is no dedicated PMIC consumer driver managing
these clocks, so the clock subsystem automatically gates them during the
initialisation. Once gated, any subsequent ACPM communication with APM
results in timeouts.

As a temporary workaround (and let's hope it doesn't become permanent),
mark both `gout_i3c_pclk` and `gout_i3c_sclk` as CLK_IS_CRITICAL ones to
prevent the clock subsystem from disabling them. This makes the ACPM
communication functional. This workaround should be reverted once a
proper ACPM PMIC driver is implemented to manage these clocks.

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index eb9c80b60225efa33d85f5f3c284eb8a63a48015..b143a42293f5a154f53a86d4e97e17a3e61164f3 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -686,10 +686,11 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_TOP_RTC_PCLK, "gout_top_rtc_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK, 21, 0, 0),
+	/* TODO: Should be dealt with or enabled in PMIC ACPM driver */
 	GATE(CLK_GOUT_I3C_PCLK, "gout_i3c_pclk", "dout_apm_bus",
-	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_I3C_SCLK, "gout_i3c_sclk", "mout_apm_i3c",
-	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
 	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */

---
base-commit: 0787c45ea08a13b5482e701fabc741877cf681f6
change-id: 20260430-exynos850-i3c-criticalclocks-dcabb78bf154

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>



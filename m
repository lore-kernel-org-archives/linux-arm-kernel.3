Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E3CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cFtPE9g4ieXWJSfE3Mqom4niwcqmKkIZ8WbFN2jJcvg=; b=wADtZCtUEYcjcxIKdcHUwX+i5k
	ZJ7JWQrUrd8yKt8qD3pTFmPwS46gVlzuDKjO8qH68tRZBpTQfn3PbmlyQKV3VoosYPGTr005N2DmJ
	7vGAWavpRTkpGGjWjwW4VmYwnGIqjDEhS4i1UilP93xYeg0R5nCTUS4c0+IruB8qQUbbqR1z0GCPB
	gH90UM0o5GWj0lUjovvHgI+ov+mxn5fsxwz87pi2BUJ8OsiSBHXHoqaL2woTIJfvZyQPGhgYGqgN0
	JFxyyfItAlGZw3GZb6GP9REsmTEotXp013Tj/e2Jb1co80IQaENlRFZiBMBMdagOUS1vZSjIRN/v2
	H3dvIbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx8z-0000000AEEM-2F1L;
	Mon, 03 Nov 2025 16:10:57 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx8w-0000000AEDv-3oD2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:10:56 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37a38e56dd5so7771951fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762186252; x=1762791052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFtPE9g4ieXWJSfE3Mqom4niwcqmKkIZ8WbFN2jJcvg=;
        b=Vo0aS8SQ3mCn1pc4C0tFgrrWVZp0q76gvJ9qB9fTpZm4gLnkkIXgyFfvX+wCUv9+xK
         IJ9piPKUACpuXQu7wKpkitQGLDsXrbhQAOQtWRtAPZfffpH8sR072rG8FFYdTwAVrZVr
         CPOxY/FVvn5csZaQ73DH7O27UnAlUNxhoB8TbNAGvCPRj/iytxOgLwr3u+3C8qqqj9cY
         0V5+tWbs7NCm/mtgHkK/juK32C3fAgaJW1zAqir/vsv0+2odA4L6NDed37JYF/8bH7h2
         W0Vuc1uVYvRHddnLi2zoLESCMTA49S+3tuwLNltqMC0/bCHECgSJMNoaxdgMmHEwDM1K
         YiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186252; x=1762791052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFtPE9g4ieXWJSfE3Mqom4niwcqmKkIZ8WbFN2jJcvg=;
        b=EdBvdMUuDS4TSql+GdIeqcvI4vFl1DvFOZHQw+lZrDslywwhbG/jOWL1/yAtrtf+7B
         +5fWms0UWRlo/RvEeN0Ivrx3m1x4OWcq8qqHR514cpuodE9B+D7z3Sp/TMv0x7l/YN+I
         /8+WYTi3I2ybdge9XvuJdJREDXfnriEhCVWT9Rn5r0FiHXtR7ll0C7UZmf0gKppoAHBH
         pikB8q4ssJj0/KQ8PCMyMyJmmTy5Cj3+q9+0Nn2Tv8R30oML4NMURb/HNUdJ8CXshEyC
         PP4kvX55sO0l1oAWdjU5Mor88t12NE+vgXfFZtH0NsKF5mQjIWaYj7HAT1a2ikSHvbUT
         uRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRnLsGewoWK/vZeUU5kgsJWTmhQjFt5oRmZgKLPqOljv6CmQHBLovPr5ZX+T1G/w/7dhmY1qT6pH79rtvjnVJY@lists.infradead.org
X-Gm-Message-State: AOJu0YywjnrNEm8KURqT/+SoGCWv/V6mdo/enIgy78b0K7OqxQkslllX
	mzWxzYai4YvnaT7g7r47c9bvIHg9FGSSsHRvT5R/VKJODSKMFuDS4wOQ
X-Gm-Gg: ASbGncs0j0OkPUtYvLkuEgMVI+nSZctISNv27JUbNQh6I900fAKucUORpIgwqUL3/T0
	IgCEJJMBf5551/Knnh6Oib34YmJExXADWreGVo9X/f26EklKO22/ThRq6stvNOp+os6JArHByT3
	O765CGpzh/sCr8vPdULB9UFkvX143HUixsJOGusJm83rmu2EVqmhVdsrAyhNThLlZvV4Fy0ycEw
	D3aYuHEceB0tXfkjDPpL33PWYrF2RRCpnmQMKikfmFJf//maDAPbzMasTvEuldwseuPzGrzGwWQ
	C4JiHiloAXzeD5ZFidJvliLTnbmHmS6mQoG+g06+u18lbG1//ushatMz2iuScgxjnGE2NQAqSed
	wKXl+UFY9U+A8eZXkTiaJ+m+jI/e74sZ5uvYoLLJ46eZsoozL93wbJeKrfQ9UARfeiJA+oZ9dO4
	I=
X-Google-Smtp-Source: AGHT+IHi5+1WnUMMnmI9WW8vac117JgHMer+uQjCtLqpPudFJmKKnUMgQHR5NcfnfbgtqZCF7Ymeww==
X-Received: by 2002:a2e:bcd0:0:b0:338:8:7275 with SMTP id 38308e7fff4ca-37a18dfbddfmr37782521fa.25.1762186251889;
        Mon, 03 Nov 2025 08:10:51 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943443966esm22772e87.68.2025.11.03.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:10:51 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] scmi: reset: validate number of reset domains
Date: Mon,  3 Nov 2025 19:10:43 +0300
Message-ID: <20251103161044.2269377-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_081054_991457_2AE2C927 
X-CRM114-Status: GOOD (  16.20  )
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

Add validation to reject zero reset domains during protocol initialization.

The fix adds an explicit check for zero domains in
scmi_reset_protocol_init(), returning -EINVAL early during protocol
initialization. This prevents the driver from proceeding with a
non-functional state and avoids potential kernel panics in functions
like scmi_reset_domain_reset() and scmi_reset_notify_supported() that
assume dom_info is always valid.

The change is minimal and safe, affecting only the error case while
preserving all existing functionality for valid configurations.
The existing -ENOMEM handling for memory allocation remains unchanged
and sufficient.

This change ensures early failure with -EINVAL during protocol
initialization, preventing silent failures and maintaining system
stability. The existing -ENOMEM handling for memory allocation remains
unchanged and sufficient.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Dear SCMI Maintainers,

This patch addresses an issue in the SCMI reset protocol initialization
where a zero value for num_domains could lead to a non-functional state
or potential NULL pointer dereferences.

Currently, if the platform reports zero reset domains, the driver
continues initialization but creates an inconsistent state:

    ret = scmi_reset_attributes_get(ph, pinfo);
    if (ret)
        return ret;

    /* When num_domains == 0: */
    pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,  /* 0 */
          sizeof(*pinfo->dom_info), GFP_KERNEL);
    /* Returns ZERO_SIZE_PTR (not NULL) */
    
    if (!pinfo->dom_info)  /* ZERO_SIZE_PTR != NULL, condition fails */
        return -ENOMEM;

    /* Execution continues! */
    return ph->set_priv(ph, pinfo, version);  /* Returns SUCCESS (0)! */

However, subsequent reset operations crash when accessing dom_info:

    static int scmi_reset_domain_reset(const struct scmi_protocol_handle *ph,
              u32 domain_id)
    {
        struct scmi_reset_info *pi = ph->get_priv(ph);
        struct reset_dom_info *dom = pi->dom_info + domain_id;  
        /* ZERO_SIZE_PTR + domain_id = INVALID POINTER! */
        /* KERNEL PANIC on dom-> access */
    }

The protocol appears to initialize successfully but is actually non-functional
and will crash on first usage.

The patch adds validation to reject zero domains during initialization,
ensuring fail-fast behavior and preventing hidden failures. This approach
maintains system stability by catching invalid configurations early.

Testing confirmed normal operation with positive num_domains values and
proper error handling with zero domains. The change is minimal and safe,
affecting only the error case while preserving all existing functionality
for valid configurations.

This patch fixes a potential crash scenario while maintaining full
backward compatibility with properly configured systems.

If this is a working case, I will check and supplement other protocols such as
sensor and power domain.
--
Best regards,
Artem Shimko

ChangeLog:
  v2: Change commit message

 drivers/firmware/arm_scmi/reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..458b75fcc858 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -358,6 +358,9 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 	if (ret)
 		return ret;
 
+	if (!pinfo->num_domains)
+		return -EINVAL;
+
 	pinfo->dom_info = devm_kcalloc(ph->dev, pinfo->num_domains,
 				       sizeof(*pinfo->dom_info), GFP_KERNEL);
 	if (!pinfo->dom_info)
-- 
2.43.0



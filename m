Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1081AC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 19:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=; b=U49IrXhZzTl1al1HKIloH36TW6
	vr7ma2YqckoIz3SoyWcAt3ecQTM2bUXqNCuY95VOjEverQF/Ie9PNkIh2BKHbFEjeovk+8avhJbwQ
	6joqiacniPJzgp76m6GvuiZ8L52+zD2gvw/ws9oRu70nbZXkQrb/ULNJUVCAvMhzqux5lscTOHWve
	sZD/3jCp4ilIoiX0NIal69QXZQip9cQlhyLqs1hAdgnWTqhf9foWnuMx7S0ILk9B8kchx5b1ai7Fb
	t1I6N1xRQe/FgE6dMcQa8Lie/ngO8ryJuqStPCyP+Hry3eF8tbhzG5Q1rksgwqOqILWbohDvSZLeG
	aqJOngaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSbg-0000000Dvbq-34JM;
	Tue, 20 May 2025 19:26:32 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHSKr-0000000DtXy-3yIp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 19:09:11 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-48d4e47eec8so1604161cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747768149; x=1748372949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=HdjRbpZYrgrCJwYcq9LdnL7uEkqDOJAZEj+EVqyFeXi4D9xywq8S5+irZhwrMU1tOA
         Th7zvYS4FZIlSvxCUsmncze601yqM4DlJbQ7Oo7B1Jt8wo/9c2nMH2fdYAqXf4g4w0Ig
         4sLtz6DeN626uCsBpwXjuy5NLwukmlJJaScX98jFvfV2WOdux6LLzbGlRBEzxoAu9srO
         vpbg1O4e9zuyj9z2fmfNGimySK/+pr+xsFNUTpOdir1/6jAASBvEDaeHlcbKVHDBDQv/
         KFqNn3Ma3cBR/3YRjPX76mfCblLTgf+sg5jj5LbBi2YQo54Q+3PMiSOqMoCeIsRk0B8k
         gbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768149; x=1748372949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
        b=UOM3076BYgUyyOXso4h3q8mQCXyXozyUp829QjAlDIRKfLZb9CNjLzeRL1tl4Ad57x
         3A41HMKsdhE9FtYKVuZ5RMaQcd+9nC2hE/yc9LZ0QHEybSgg1lb9xH/o1RPmtjlFTecu
         /dhA2pKhLLeBib3qNdErcRrDrh2vc/AV6YAjYFtY8oqhYkQB/3h7Uu1Z68vegJi+e7Ct
         PlgdpHsVjHsdXO2qBL7q5B9emP+SNyJy4sftgsibqsCzXc+SdnuJhqbEEQys+3iLyuju
         4mPO1wzq2QXOTVHN2W38MEsUC8GAbEXPpnW1lGGtkr+UFWbkZt9VKgBUaDZ+uNOfF+kM
         TRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLeA7kgZWQQ1eIOvl4ioyxdeYacdIvaXjfw/fSVMljWk3eVgZjn6VQPn43pU5HOkETZvH1yuiXk80spVTMzqem@lists.infradead.org
X-Gm-Message-State: AOJu0YwFRhOJMUCLb0D2DyVqwm7X2bh8lnNWxfatEA9jQ17e8pFb62yI
	ttOUrgvAJuPI6nb3dlwkZPiT4nI24hLXPkpjzusB490JfQPmHfZYUKx4
X-Gm-Gg: ASbGncsXmRx9HsEvcQXXpZVcz7HnEmjr17pO+Kf1a5eEUQR87GaHHWpHkF/wV298LI5
	dnLut6erLcDzV94q+LPrAajLCxH9GSnS/MT8UUfoCKeGm7/KUp3O8SaLs42BuL66OaMS6yk49Mi
	pJkRMNQiegelVagz7cWmUw0mpjr2BD2TolTziMllwMEJL+EQJEW2qB9Pqn5kr+mM7OBtkwYX5HR
	PaH75VS7MTXAa7Y4/PZ0tdjuF+Sl575y2sOoUq1gFdQ+OmyNQjv2xSQi4aYtZALBinBbs0j02kv
	WGSSxFTo7eQ4GXty5FvYHtaOPWOCrKZKz7zPFuSi/BcuQdrS8V47CrIOh0eXKCMkv80oQlpGnMY
	nu7bCWz4l3BLcDgXeSFxSzZZNCAuQXg==
X-Google-Smtp-Source: AGHT+IFR5pt9/GVP1EPATJ5cgZRIzs6LVruq0q5vYeQ0eAM0wqovWxYcOeeO8H0l7rzEaFl4O0FbJQ==
X-Received: by 2002:ac8:5893:0:b0:47a:e5b6:50d4 with SMTP id d75a77b69052e-494ae3f7e46mr90403491cf.10.1747768148499;
        Tue, 20 May 2025 12:09:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com. [67.243.142.39])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:09:07 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:09:00 -0400
Subject: [PATCH v8 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-7-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=V6LelLjLszEjGIEg7Z7nBX+1w5ysEhFN0tIa8dRMNROYBzA6VMJ+NwDe2jnJAGKdUiJCz18nz
 McgNjrJt/A6BgWCGL2r/nQUpmNIJeHTCHHVFZazeqlf0zl9zY1lh5XO
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_120909_979602_3D95E1E7 
X-CRM114-Status: GOOD (  11.53  )
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

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f792f1f43bcc8056102a43d822c96..4106b6b372117119bbebe67896de18fc6286fb44 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident
  *                 Region (PRR) bit in the ACTLR register.
@@ -71,7 +70,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
     void (*set_prr_bit)(const void *cookie, bool set);
     void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

-- 
2.47.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB88C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=; b=GMuZ5MLRl0o9V7nhu9bnFeHZ43
	Nl5D+1kwqmlJo7iZDMpzgkWgK8Mh/FAgBvE2G2AcamuFVgvFjqqfSAXTi6HVyOY4cd446XlArrk4t
	7FGI0AHMP8Jg6gzZCSYwlmyou5VRTp3yr+QuevB6AQjmL8TTYxva0GrDy8b1TjDxBPVhq5qLFi0xa
	kB7KkQjyn6fWTO8Uq7Y0Gh9UoHNg/PlTVviaQcFzoyrZH+Y5ajqtaTJH23zP9KNsgvct6qrZ9W7O/
	dzoa2V6ioll6KE5ZeiFIbhYqVkcoAfV45rR/TyCSm2yGcH2gTY27c2Cd71spxMhdoj+JtkTFNP/y+
	6TmzFgHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKI-000000063Bc-2kim;
	Mon, 20 Jul 2026 07:22:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKG-000000063AY-2tX0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so9172442a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532126; x=1785136926; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=FyITGyJLBJZrr8Dyd/qBNSXjZb1ETOP46RHLCYXHel3skPnRqtNsjSzMcLfZ1Q7uNQ
         jtC4Hauhv5aOkdJ3sPrOyLDEHSzFF0nsa6Yu0jIKOXdV1lJkgXuT953wJkzjYPD0uC6W
         eTJg3LGHaF5HFUWN70AkQ5j+XW0eIBnWgGYY2QlAowXhvSGuROwMVOfzuXygWFekMsEf
         KnEgvMp29nyjrl3UvmxJY58g82VkBYgd8u+w8q3z+Fm4ZN82U8SaR/+R75KUQPQXNTdy
         D8NARp1sBmIMkLwvgRvtEG2IC95Sn7m6ClaHXRpJs2XWyFZsJrYTur99EDTOv7BnH3yR
         VkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532126; x=1785136926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fm7uYEG5s4l2Qi1Q3lmMTkR8sLj78MMwG9bX9Qa+qk=;
        b=f7h/kmuRqLYI2VWtb39Q/2v0k9p7w7aBjAnahbPmcIcv1In82XuLhXiTkGma7S8na5
         /1f13ZkobFgF+FqScOMGL57dIjgbDGo4a7YdSFsIQjcJf6IiIPSQHRooORA9VvIq7XcX
         AYGaYWFT5+hT2R6dvpFu4PF9qNpwMLf0YXrbvZJqMGgbnUK2kaZKjhLnGQ1XWY336Mhh
         hgY1zQrDQD/GFfKAtBjAFllZXLxXeGBJDkc4dTfqGKmNCdhebt3S7j/tK88puMfFNfN+
         j4JWANjxpzqmOcLRn74/lMB6LsdgAejwIXvkJkP6pYtrgq84/jA4oIUaO3endVIIrjL5
         j7sg==
X-Forwarded-Encrypted: i=1; AHgh+RoojZ8xhN/6p06HfBEdiCC+2NhC8oGxBNDY2Ly3KalmD5L7sTRfbWa6bwZswWsYxj6f/+25CS39QsvCviVHF48h@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvr0t5TnhzwaHg53OBFiX1PTd3RSaqXX4AAGMTb6nIuCOSrMeI
	KB6d17AczsKjfKcAvh0ihiWxazrG+5GmNhH+DrmAu/zdAJEX+1C9aZnp
X-Gm-Gg: AfdE7cki8K6VoMuQTm86VtBHnvIXuFSMUnom90w+/8a/X3iJAalSqqPaZjj6ss5XVIL
	eGeYSu/na3cZo0Sb5avRYCw/KW1XZ0QdNIZoqjT3OsRKOdv2m+mTLaUZqPEH6gCJW+MvahLsFQy
	2YABV4Gy3XiuismxUCsLTL25guW8A6Phxmy0o7QadzOF6UjlUm4/Q57QO9HV+jOZE+e3ZBGOCX3
	GKmT/CWHX6aUOcog06HVR/b34yX4X0AnSi8bFVLCAzh0vxWlEkFpXk6Af24GhuM3JVJODqrq7Xo
	JxIWuhAIUUA1mg9DLfT5H/mLSHISRgmEMbJrGeoDyAdSBYApgZFVj19effGB3pZ4PCys1vQeyED
	NbOQFdIQ7C+1dvCZ53pdrl0bDIly8hElBDVPVCxO8rbOIxQkN694J/OSkO/t4V+wp1V1SxNPlte
	PqO/R3L1YgIsvUy3Ci/G18Z7/ciGoT
X-Received: by 2002:a17:90b:184d:b0:38d:858c:834d with SMTP id 98e67ed59e1d1-38e4b47726fmr13853861a91.17.1784532126260;
        Mon, 20 Jul 2026 00:22:06 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:05 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 01/22] RISC-V: perf: fix resource cleanup on driver
 probe failure
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-1-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211932.543975.10206534637071583934.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=522;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=ysgPHA/+x7CEppuRQZHdHoo9X3ZDd6yInqnds9Ij0bo=;
 b=qvIZNCLm5+fXN3DnRuew6aKjZnISyDx8ToUDRMjQnEAf9oEg+M6noqRVyXRmMKpzp0n+0SKqQ
 v5ga/susCSiBn1ylxb3JFmtsT1uI3nl6wtJUgUv4oCsU6GIAT34AFQ0
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002208_739648_85082865 
X-CRM114-Status: UNSURE (   9.52  )
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

On Wed, 01 Jul 2026 01:46:49 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Sashiko pointed out various UAF and memory leak issues around
> pmu_sbi_device_probe() error paths.
> 
> If the probe fails, here are list of cleanups needed.
> a. Already registered pmu must be freed
> b. per cpu IRQ must be released
> c. pmu_ctr_list data structure must be freed
> d. cpu hotplug state must be cleaned up only if added.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie



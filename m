Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B1C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 02:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IzNyT7kT6q5Wzdn0wleELhzEPkL/zGsA6KbUIEqQcqk=; b=BXuy0L2kR0ULabFqC4m29ufV4s
	lxo2RRR6ldHwyEF//vPNwbCrxi8Y43JeaKhL5yoQt0yJhArBjbOZGF9MSu69AnQXkuUT06Hm7G9+4
	qwDMdsDLM6aOWspEER2nxf/sm7yG2oiCTq1AxG2vpUPLIO1VwvlMTjEIe7P3RTQirRnJgmuFnAU3i
	Fd/iP9fNYGkjVaFudYrlPOmXOYzcGWguQSpOAackWu6VPzKpDu+7Z3hifOc1URs7V5areo1Eq0UsR
	kNEDvXiYDtJ3CCPmRRbWWx1ce1Ytic45aqhILWWtB10gbodcRb4NgFo57BMH5/EKLd+DkjCkozctA
	iBAIHVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8Ez-00000008uAk-0W30;
	Fri, 25 Jul 2025 02:32:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf8CW-00000008tyh-3Jwu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 02:30:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3122a63201bso1234674a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 19:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1753410623; x=1754015423; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzNyT7kT6q5Wzdn0wleELhzEPkL/zGsA6KbUIEqQcqk=;
        b=fWUDGW/pw2UhMEfwFjQHpJnKrcL1gZaMbcY6cVRdM4qeno5ZhAqOj2uWc86RJeaTn3
         ePSS091Hs8K6oIegD/jkmkBV6QDJo+nIS0A7UUmU4LPB2E02zOzICvZHiQKUniGFz9EE
         E37j3aQQ9vrWF5wBIW1lA46L/kuE27WN+ymVZaUPPrHbplEQ8jDlaH+ci88BEqYukOEA
         68PbqwrFuimysw6YGs1ACUWul2lUi3aAotDQjIwu1nSyrJIJxNcZHhMnMh5Kv90nbVKF
         /tVL3RxYKB7GFK/4fNeyDPBm5bWYwsrq8s1wdhc41a07gte/FIsknA3d5QZC0hcXyGMx
         sgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753410623; x=1754015423;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzNyT7kT6q5Wzdn0wleELhzEPkL/zGsA6KbUIEqQcqk=;
        b=SmZAtNSIyXwb+zhuNW5VaaR9pIT7bBq7cLcrIrzF/tsQ6jcdGF2USoPWTwM0kuxkpp
         QIe9hE+1ibCJh0QdwYfq64nu3F7SK17FmB9pyLNOnxqUeBo2lVH8nYKFOYVzhB8N60f6
         hztHIrKcb17fGbqm99HVps2uI944XIACbDncsgVr4Em6xemUUEiuJwNBdG6T2ADfXdCJ
         pe+PMYmJbmu4xwTbohGd7Mfl1aGpSidf2dL5JZgxSHZE6ZHJnEX23HiI55Z092LtWXJj
         TpIWe4sBv31QpVgqYwOiKIbo7K5If0NJVGNkTakLpCcIcmj8fP//3Mrmx4gZEqkN41rG
         GANA==
X-Forwarded-Encrypted: i=1; AJvYcCVqonXc5huXrnC4Ylf5qKY8SdwNGOCa5fcIz/VkCK/gvcDpciL1rTRUB7BkE2zhX7/TTpOkQxL5hEnFcpTHDHog@lists.infradead.org
X-Gm-Message-State: AOJu0YxSn/NPkJyz0zX6EIHbO+7FPjWrQ7StvjjeNXy/aHPmn6zsZZt8
	etk+fq+eTi9Nld1F9y8vW7/Z425REAOcn81khTrt5fIcHV8Az+JBeq7xIkUZqPVd6hXIIzJKGhK
	L0jEj
X-Gm-Gg: ASbGncue3KQ2BPmO3n31UfMASTAv6k4c/55OrZEBkNmcJoQrGA1RTK1q4UnSp8WUQ6n
	REad/IgqMmcRRvDsE13EZeIgLyMZ3fjS0bqD65ocXwBE15VXAABz5UOn4gI8VFKL2O34PbVlUPv
	EYTK3Rw8Vr3M55iEDjbz/Maw5fCM6MESdeibBl1oYSnGW/HbgHIxvrUKkNAKiw9lUlWZNSaGlbU
	OLQoXduEBetQLsVkKWJdTY8OesangCoUm96Sll0i7MxR/zq1pIlmm992n12B6cbT/NmZhG2newP
	ROLUD2QqiBPRHpn9tD1TSNtpHXoGvdeGsjdxWuuz82xyQN/RSJlXAIu2EaoZIsr9UoOT3xc2/62
	Iyd03Ynml6GrU9fwb
X-Google-Smtp-Source: AGHT+IE/JQ17vraDGeJga3EwblYo5gMjHeSnZXLQ4fnuvAqQudx6Ma2rSGNGbR/4X7sMPO04Ptz7zg==
X-Received: by 2002:a17:90b:4f4d:b0:311:c1ec:7cfb with SMTP id 98e67ed59e1d1-31e778f41e5mr224447a91.21.1753410623522;
        Thu, 24 Jul 2025 19:30:23 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66296420sm2377133a91.9.2025.07.24.19.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 19:30:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 82af5ea7c611c80bc8811cd7ce2122cbdd3da134
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 25 Jul 2025 02:30:22 -0000
Message-ID: <175341062209.108.2784464375053139378@508e4dbc6f9f>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_193025_070743_2E295D5E 
X-CRM114-Status: UNSURE (   6.41  )
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
Reply-To: kernelci@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org





Hello,

Status summary for arm64/for-kernelci

Dashboard:
https://d.kernelci.org/c/arm64/for-kernelci/82af5ea7c611c80bc8811cd7ce2122cbdd3da134/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: 82af5ea7c611c80bc8811cd7ce2122cbdd3da134
origin: maestro
test start time: 2025-07-24 15:31:07.365000+00:00

Builds:	    9 ✅    0 ❌    0 ⚠️
Boots: 	   19 ✅    0 ❌    7 ⚠️
Tests: 	    1 ✅    0 ❌    1 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:688264b52ce2c1874eec2c88
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: cd8180-orion-o6
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:6882649d2ce2c1874eec2c59
  history:  > ⚠️  > ⚠️  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:688264a42ce2c1874eec2c68
  history:  > ✅  > ⚠️  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:688264a82ce2c1874eec2c72
  history:  > ✅  > ⚠️  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:688264932ce2c1874eec2c3c
  history:  > ⚠️  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:688264aa2ce2c1874eec2c75
  history:  > ⚠️  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org


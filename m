Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F5BCD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 02:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vqwzvv9pMkz9zvXFLT+vLs6d3Ry6X2b0UbPHWNDF7c=; b=H1YuxCpOYM4VTHYI2lGvp20+fP
	jlYG2CmHZSkKRF6SnAx1KI1LSePd3dXkE5S2O3NfqQ5D41xqZcy5q0GEperS3tG2k1pNLgZ3qn9E1
	TTkcj2N1fD1ez9ZAFMgnCeDdGm0EneU3Z0FRcqDZ36imiNeckdezsN8wQhc+YkJu1m5+yJojg5mXL
	5N2eCKneRvk5fiWhR7vEo1A5Pd3BpNEl1DXPPl2n9P/N/EKwEivPbqa8K1819cOapvoaxSYSqWmhh
	bc+D7LioC4jXw+wv/ZGhRcYZhhB+iRt0x1TQxs+RJft7x5Jtt4FGJZp6OutUsapInaoy7UkcS02Sq
	+psrPcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgnx-00000001Onm-2qZ0;
	Sat, 06 Jun 2026 02:30:33 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVgnu-00000001OnK-2B7h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 02:30:33 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1363fe80fe8so3887620c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780713029; x=1781317829; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vqwzvv9pMkz9zvXFLT+vLs6d3Ry6X2b0UbPHWNDF7c=;
        b=VTsZ5Wntsmi+0kol6MA2MZGwGSP9JTyR89Kh3YOwzfpfUnz81eXebXl+ar+BEHP+Bp
         /eqzTmWAxpXlUFxCGvumFvLXHKvYMjwmgWaHjdXuZDPMZ1wQMCHnPLS8C8x1ecKJyK9u
         4paXHfAdMB9FyGGwgVah7w4AhMr5OUn2NZOCH2EFG69aAdG9xtEEWTMJJ4Tn96R7/DNq
         Ge+DrF/31Q6gzqS2q3xFRHVKiY4eJO7qTvu8i1aeG6gohbhg6tXc+G5N7x6meOEmgg/V
         wEflxBiDljSeB7Kpbl13HOG8TWB+wz/+WsXOlH6XulHX0vGlTwVJmWNB1p4qGdGrPyqc
         imAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780713029; x=1781317829;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7vqwzvv9pMkz9zvXFLT+vLs6d3Ry6X2b0UbPHWNDF7c=;
        b=VRDfvEF+kAcT6HqbZwlWAbb0REfgbOsE5rMtN2JN5okZ+2kBeEjdxB/NG3hUwFG9UB
         RknOtjA/Kq6r3QigtHDrezJEUva5yEZZ7o0MF0AZmHax/m+NuLUSXDt5D1SINGxzsafX
         xpcBIC6eKXWbZngPAsvuimVjt1A+zsD3MHnQZBPPu+V9GjyuAmF2uFnu3p4kNGuRV37g
         RBxDbJ6FGlqY4PlEdMi0L1rgTQstcva+KrZpCS8xpFP1JxelssUP9/F7y1flAGhf5NQ6
         QrQhO1/Mfnr6dnKik65GOlBwzgIxmbbFFFFRjMWKG/KO23T1nhRIyGin41rYGaC+lJak
         oLgA==
X-Forwarded-Encrypted: i=1; AFNElJ8LoOCy5+975r0/MfbRZQPwG1nC5egmqW8UDoByp3dSpQ2TdwLN6wOT53SQSq0/HIU+8HR03Er4OxrsbcEXr4ZO@lists.infradead.org
X-Gm-Message-State: AOJu0YzlqhsQc5Y6nQf4op8Ys29KEvYVdSF8q700Mb9kdJDTexyD7OU6
	P70HvNqT9qYPp6xjM8otBH6yBZuvKedrvnbQm4PVA73Zszix21iqdj6ryJLuPuDXYmCo+Jt2yhT
	a0j05
X-Gm-Gg: Acq92OEbf8h7e64JwwOPg7bMLqBF7IrHTOYvVe+N/Uns/qrvAp1qYl4+XyTVDggegDt
	q9tgTtE/r2U2FJsWAeSal6fQsI6BHG/CRlbuto94tGWOZHCyJX6+3sNS4JL125NoemNY5vSPAc9
	B7Kj5J02tfFWiaK3I+QtWSgqz4P89+S34o1TnQkG5M87mjqindvy3CK4OLeo7O0vkWn8r1ADgzw
	Ad+cBrdb0pquHeFuzC2rJcAtQuMt+HCNYhr6k9Fc9kfpLuApqhnGN6tbOmoR8GzpX0Zl0oiMdcr
	Ceb74dbgxkj9NlsQXS/IhVhZFBmqr/dguG+aeKEiFEV2+GDzsPfZLLppgMuZNvU4REhKVA9Eee5
	7jRkcBHS+ZXuE47x7RihjTFwA0V34c3vxVEvNJCN6ogzgR1xs2T/3fLvg0B7BRebdxEl3lAtMPV
	SjTo1YmydLQUAeQSW2XLqBzuX/7tU=
X-Received: by 2002:a05:7022:219:b0:138:144d:35a9 with SMTP id a92af1059eb24-138144d3684mr1227337c88.13.1780713028853;
        Fri, 05 Jun 2026 19:30:28 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13803eb106esm3722666c88.5.2026.06.05.19.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 19:30:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 ffe7bef3786c1c2a725f80c2025010644452fd1c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Sat, 06 Jun 2026 02:30:28 -0000
Message-ID: <178071302792.10884.9460167645001413637@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_193031_036099_4C26C1EF 
X-CRM114-Status: UNSURE (   6.34  )
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
https://d.kernelci.org/c/arm64/for-kernelci/ffe7bef3786c1c2a725f80c2025010644452fd1c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: ffe7bef3786c1c2a725f80c2025010644452fd1c
origin: maestro
test start time: 2026-06-05 17:03:21.134000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   12 ✅    0 ❌    1 ⚠️
Tests: 	10548 ✅   84 ❌   93 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a230ad146e71b76f9f6eb2e
      history:  > ⚠️  > ✅  > ✅  > ✅  > ⚠️  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org


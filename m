Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E58CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 02:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0uxip8mmXjlMLXQffAW7Fs4yfanI33ALk/GGMBf1AAk=; b=ipBqIZ2ZBNxSAWgn0C/Bu9CkOA
	C2e2n+2y3s3I6KkGLS23BFpOHny606aHEXye8d0gKaPXAbzPOiJs24DzXUXln/xl3PMyAue8rCAzN
	DPsNYlJBfpPtpx4JHZqZy8xi8LzE9IwTmBKLjxawsqHrX1LSnmAB18tEmRlrTc/u5Y4JCMOo7HR84
	STk2gJLyveI3/6KgjePtjI7JislPeAvbMa6Vmi91x1qjA19kvne3zn5JAIc2MQrqGZNvL2vc6wzL5
	jndXCkZxwudeUDOHI2lxFK4HMrJ8wJ5/q7GDfVImU/AaWYfX8cT8QF+FGCkxNTVmLXEZMXIfTVVt0
	FuH9vXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx63-0000000DT9N-3GOX;
	Mon, 15 Jun 2026 02:30:43 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYx60-0000000DT93-1wdY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 02:30:42 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30807ba471bso8214654eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781490639; x=1782095439; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uxip8mmXjlMLXQffAW7Fs4yfanI33ALk/GGMBf1AAk=;
        b=EB9WyWkIoFbDgXt6H4JLAIGaNQp2vhHJFJbE6nRh67xcNsu5oLenmLR5BdBlXZwD6C
         axsINI6ElJIp38i7OpcSw/FoWDBaO+hPT5fDHstBBCwRcTQmTOn8shbLayN56klpEPmk
         EX4iVrwEyeNfAmcthWweUKOUY8smRqTPuV3wu1LUNLVAiUqOfWlIqyz0Eeew8tVfHVXg
         HMm8YpSyObwoobA/jxME01aN38/sVmjckqPwLGc1885b6l78HX1NMXBo7fBNiGdMmvfM
         SK5WIUOV0+EFdIUYAbnq6YQ5dvoVARRutAzCmTHBQr3MFp20WStNryo8pQ/E3lvBM1t5
         yuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490639; x=1782095439;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0uxip8mmXjlMLXQffAW7Fs4yfanI33ALk/GGMBf1AAk=;
        b=s9DhLyLvXoyK2vSxOggIbSdtyOIIap7JXrZbaILmgMfA9kEkwJut9Fhqoyufxw51cj
         LK915YLA0saJbUbk0n4MgaCi3HcKtznTrP3rRLU9OB0DDSPt7shJZE3ivzQPn8K9FS7+
         04lFJGEfI152M+RIxPVKG/C46MQ7hMUCwHof4mQoZeQnjA191h8lptY4NR/OUPlJVMbC
         yclU0bHbXkNfgFSrLKX7UHFWGKocpTwnnoEe2D59cPf+hWL2133tIezrQg3N0L+fgCJX
         /21T9bRolsmcDGM66jCxsrmBVtzGl8KuYkAkHgyvazO1+1stRK44TO6F55Kgd2qFwo9Y
         /jww==
X-Forwarded-Encrypted: i=1; AFNElJ9bEWhUxGasOw8TyKnXg9adE+bxHsgWw/0cI6QIAt+705BFmo1ngMweP6wfVkBz+JFrXCFn0WnxNWNf3B+hRqXv@lists.infradead.org
X-Gm-Message-State: AOJu0YzN7OviA+KQl/VTFFqxa7jcQOvql3PLb3ix5Cbrn+7nHIP8gQUm
	P0R8gJK7+qLE/NVawYBN3z3dCuYrGiPt7aqXd9Zrp/VkhQSzBlvoX2zL8zF5WvI0AbxM9lTc+DT
	HxcFT
X-Gm-Gg: Acq92OG1nUHDZ5qaNHGmyCqvdfUWwoveVE7k/9CEnY9vkeemtHTTqnNC6aoWOlWV9GL
	MEM9UQg6KCThIamYAWuNN7d0aY04lu1DyA5U1ENCd8TlCfzYGxM60aKYoLb300IzmG9wA5tLVZo
	swxajbh4t40Vcp4qvS42hrDBmwNfPW1wZM5ZpPeRawQGG3ZnJ48rQi7h3Vng8Kr3clUq1s6u+t7
	jnCnShEvtY6RbuGF8/0T8kKDnjyqKUmhaOooqdXPK0ldobwt2C8hJKU4BRj09TWQBu9haH/WnQ+
	VVE2UAipOC7z6P3jmCpKlkydOquS1Co/RB3pzO+fRLXXctiYYRZhi9+JQSH33ytYyAltgjVzpjF
	i/cg6xQKmSieJrH0tCRCxSW6HYnYZbULk4SVw8FV5ch3G0BWci6Ht4mUvHEfxQmp+vtAUWevJk9
	f83mbRVm+ZlgNDCoeg
X-Received: by 2002:a05:7300:8196:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-3081ff75663mr7633231eec.11.1781490638695;
        Sun, 14 Jun 2026 19:30:38 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm12474871eec.19.2026.06.14.19.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 19:30:38 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 c2a9495bd873ccc028a308943bffcaac59e5f454
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 15 Jun 2026 02:30:38 -0000
Message-ID: <178149063779.15021.9817629459510168818@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_193040_733595_F54ECA25 
X-CRM114-Status: UNSURE (   6.20  )
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
https://d.kernelci.org/c/arm64/for-kernelci/c2a9495bd873ccc028a308943bffcaac59e5f454/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: c2a9495bd873ccc028a308943bffcaac59e5f454
origin: maestro
test start time: 2026-06-14 12:20:23.583000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   34 ✅    0 ❌    1 ⚠️
Tests: 	10578 ✅   84 ❌   93 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a2ea4a3dabb8c619d5ff17e
      history:  > ✅  > ⚠️  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org


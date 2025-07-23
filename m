Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CCFC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 02:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u5C4qFl3czjooPZFOtVVGuRGz5OdQQzdeDjpfxTHDxY=; b=OtYbz4Hr2vDs1AynttdtYslsDd
	8pYi/xV9mUnbqQldvy4gWe6VBhUpgVf7jyBxu/prPvS488MFGkXyS3CqbyS1fFbef6RSvbWwDqg1W
	8c+MR2xt1powFCwG/UQV80xR2ZZYzXEost9XTL9bURwX/zJMXOaU65tKSSao7/zUvXRtUp6hkoaVi
	vB63aYwKpVPDU6kem7JWCATcUwit/OCZdZ65yTtJ4aKRU38xIEJjQLkLGHW1HaFHsog8gI14taXUn
	HuIRRz4ru+994bFXjpx3oXItAaw1pGD3qHnrc/y7cVb2DAwzoxWzJ3WiSeHo3c653Es1rwLOEl/J/
	IIg5GzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePHi-00000003r6h-3SUm;
	Wed, 23 Jul 2025 02:32:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePFE-00000003r0m-3ZI0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 02:30:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23dc5bcf49eso76881685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1753237811; x=1753842611; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5C4qFl3czjooPZFOtVVGuRGz5OdQQzdeDjpfxTHDxY=;
        b=GvNq3TM0QcASpkqcQZVUSY5qBC5tZw1lRYY7opyO01A83oMuUH9Ho4Qtn4pVkwVxi9
         S4dzfgNP+jA3awsMy+/BBJp9bLpk3x9BP9cqsgYFTpzqDQ0zRFGGQPLz4O/G2aCDDdcp
         +V9KoJVRgVnNU++0mMT7x0lMR3ajW9htlKcpXjlIkogcOAZ8Lr2WXBpN49nmLEnaHGUL
         Wn5/WLvf7m9+1zXqQHAnAiCQqkjQIxXK1TYDHh8/xTjgnXuo2aXALsYc+sSxAGs0e5Qb
         UrNHGeZeTCgM4gr8zp8GWZrtdiQvTYK0JDP4VbRSY9lEuAZaj0pnu7fihkunicw0Vjjf
         93jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753237811; x=1753842611;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5C4qFl3czjooPZFOtVVGuRGz5OdQQzdeDjpfxTHDxY=;
        b=Ag6SNwy+eyiF99bJPQBxhzOshjpCvsYYOfz+CrVb8UNr8rMb46m1SLdx2knJnJGX7q
         TajlmsTTXGzTr7gKxV0km60L7kz4CydtuP5dzHuO+o0UF07JpkRyW/gT29xS1QIeyJz+
         rp+cwz1wk31/Uff9lAKbH2jp3t4Kl9lzHnkGInG32FodobkIyqPQupUaf0ZmSCiE04ZC
         GAa1JAeTb7GzVrLbCeHdg0KwPmpNXf91TdIoJy8eXQAmQ3ovkjeQk3AKDgBggeY6S7Si
         5dXSk25P07Yi9QjFIyB17oUwo7ELxiuFd1s7Qo8vdK2Upqn1z40Be077/SH8QsuFb5D8
         MRSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWem458SQueNcJWeJgAX1tChxb41txP4uNwyzTMuMhVk8VRwbjJ0rvDn1so7l76t3CrdsRgxYnKdTL7aNkvff07@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3OHKsf5J/R+sZAFCbtwpPn6UGb9mFf6WunkkNKZKL7FgobM+f
	9P9ARA7QEOM4IbjHuIzc1Yks0RSRfi3+TDF/qcjm4Ut12dFh/V/huHeIJlOoGVg1QUrgT7CBliy
	n7wWA5LNdHQ==
X-Gm-Gg: ASbGncsZaDyRW+Q9HRiRPpytBXUGifyqshUTJ3E6O3zrqFFtgt5Ry2BadSERpLs0JBM
	8+6tAWyh0L9xOv7NZz69SSBHrzmzMSVOrzQqm+tenEmgmCNQcl4D7QzBfRLv5lDoHKHV3xgiN7e
	o0/tSTWHWdRKdEbHYFjxUFnNE/XBVLLTU26Wwj46V/0QvpnA1uaRk90CAoy5hJlr1WqKpQdlnm0
	1EuV7xkC3Hr4+FakH9Ogf/GmREwNwAh/2Hx12OOURS7DRb0EI/5cEmUPZrxNF5ExgIxcxrxLc8N
	tcsvDicJp9X970jYjMXeG3k3hUvfwb7KQsJ6KFnqDuOMd9p7jJ8L1J1705y4Hcx7Y0muDM6wl3X
	SX8+Wi5MboE0gPA6F
X-Google-Smtp-Source: AGHT+IH1epM/IZM27l6zZwAJ0CbYJmpwpZqQxx7Vmwi88jH061d4xVHvoCtTlOZRUgGhKzFRdB+jbg==
X-Received: by 2002:a17:903:174e:b0:235:866:9fac with SMTP id d9443c01a7336-23f9812b6d4mr20141005ad.2.1753237810952;
        Tue, 22 Jul 2025 19:30:10 -0700 (PDT)
Received: from ee9f968c8f28 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4a93sm85085245ad.102.2025.07.22.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 19:30:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 29e0a1d9558fa25208f9fda5b9217a752dd9e78c
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 23 Jul 2025 02:30:09 -0000
Message-ID: <175323780935.99.1768225303085222258@ee9f968c8f28>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_193013_140452_E5329A8A 
X-CRM114-Status: UNSURE (   6.90  )
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
https://d.kernelci.org/c/arm64/for-kernelci/29e0a1d9558fa25208f9fda5b9217a752dd9e78c/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: 29e0a1d9558fa25208f9fda5b9217a752dd9e78c
origin: maestro
test start time: 2025-07-22 10:27:02.614000+00:00

Builds:	    9 ✅    0 ❌    0 ⚠️
Boots: 	   19 ✅    0 ❌    7 ⚠️
Tests: 	    0 ✅    0 ❌    1 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd82ce2c1874ee4ac24
  history:  > ✅  > ⚠️  > ✅  > ✅  > ⚠️  
            
Hardware: meson-g12b-a311d-khadas-vim3
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dce2ce2c1874ee4abd6
  history:  > ⚠️  > ✅  
            
Hardware: meson-g12b-a311d-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd42ce2c1874ee4ac09
  history:  > ⚠️  > ✅  
            
Hardware: meson-sm1-s905d3-libretech-cc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd52ce2c1874ee4ac0f
  history:  > ⚠️  > ✅  
            
Hardware: mt8365-genio-350-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dcf2ce2c1874ee4abd9
  history:  > ⚠️  > ✅  
            
Hardware: mt8390-genio-700-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dcf2ce2c1874ee4abdd
  history:  > ⚠️  > ✅  
            
Hardware: mt8395-genio-1200-evk
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dcf2ce2c1874ee4abe0
  history:  > ⚠️  > ⚠️  
            
Hardware: rk3399-gru-kevin
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd02ce2c1874ee4abe4
  history:  > ⚠️  > ✅  
            
Hardware: rk3399-rock-pi-4b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd02ce2c1874ee4abe7
  history:  > ⚠️  > ✅  
            
Hardware: rk3399-roc-pc
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd52ce2c1874ee4ac12
  history:  > ✅  > ⚠️  
            
Hardware: rk3588-rock-5b
- boot (defconfig+lab-setup+kselftest)
  last run: https://d.kernelci.org/test/maestro:687f8dd02ce2c1874ee4abea
  history:  > ⚠️  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F6ECD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3qYa5R94cy8jsn60vin6HxUHURIN1ojFOm03PplfBQ4=; b=RoY29T2tBd1aYVIR4hG2qGLKIC
	12uOZJMqwrObotPP4oe0BHP9n9zY43zLBmumEa8oIDX9IL/FoxAQfSqKPqHGgcbzFcDsbQg1qcKQN
	eobXWQdZpSKUAdbgPS4edxeQqab+NAXfMGnyBjkmsNuZHCNVZjHOqVQ03gELS/Lm6beE5daAUj4BQ
	X9ZBOFUf/MfUyYKnieS5Wqe663ikv525gHzijnZCYzwGt1FiTb3qWs4qrsxpG2OH4/o4R3c/UK6hI
	IxjwEv2IjQHwsiangaxPh1OlsJ+PIhXttx84vwydxqNEvacHkUPrDXQ/uafJBzfvEl3nu0uLBNZjh
	RZnoNV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVBT-00000008Zrz-3bHM;
	Thu, 11 Jun 2026 02:30:19 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXVBQ-00000008Zrc-2ytQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 02:30:18 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-304ddfcf72cso7975584eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 19:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1781145015; x=1781749815; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qYa5R94cy8jsn60vin6HxUHURIN1ojFOm03PplfBQ4=;
        b=M/dX1OnYFnFJfD6AzR4BBpBhj1vBEzxxNaqpMImglV+Wn7kRrpEAUmC/uJuR1a3zbn
         cfmKPe1wfljGr+cvto+7eF+TDeciB+NAawpE/Ytk7IueC8BX++KumKYR1QHmTMXGLKFL
         JM8kh+axtcbBOgetL0xES08e9IWbP2CU1haBQU8fy37hpbIOtRmfwLxOEgs2eZ1fGFBu
         BwR6ggKZpi7L9cZkcRciZqrPIJxFCPqku4naWlvNVqjQZ5upyfPC+GSkTIsi2js/OrY1
         gsKc0YN+GYLilJ6SXvtfbkPi2vrY/xk4THxziCkzxnA+dJ+BCdYqQ6bxvK5zRPAepVfT
         Kgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781145015; x=1781749815;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qYa5R94cy8jsn60vin6HxUHURIN1ojFOm03PplfBQ4=;
        b=mE5CvpJQml5vOCIMR+6kPA2B8vl0wksRIJdfBQUHUx/E4gWXwSMSOhKw/K71+8dbSj
         be4jzrthkhco1W7Cjz7wTuNiFy4MKmzZ17HGwqAtzGMZ2/GeBf94Dujurbfp1koxK1pU
         eecK5J7uexrrXCz2r2xFtt7jn9pnCo5BNrSRe1QA7lKo5N0MLSWTWDGV8BOvT7cp2gr8
         lN5w3Wrf2hs2bgAEMEMe6eOxELbaIiHYqtH/IllZt9xxskbBHFdNdL0uMpLU/g8gW8t/
         BTIfjb2AFYzd/YVvDlaC/KZbau18dRghymLX4FPhiB0XA8PMa+kM7Elj+KlTu1cFUUGH
         YkDg==
X-Forwarded-Encrypted: i=1; AFNElJ8bN8sM592A11gtP0D7sWW8T7z0JBGMEBRNs6rPFtMBI3tGCl89VzEviGX/OyMphYHhDR/rJ6RsWiZYzqVe+VCM@lists.infradead.org
X-Gm-Message-State: AOJu0YwomdMwWyOaABbE9FsqvoiP4vXgnd1e/YXpPs9KXSD2dn7heabQ
	r0XlVPclqxng0BAJ0AgbjdKoEydGJJxzgOYTdeHyz4+71RwAgUcBF32AMQqpqqhwFbU=
X-Gm-Gg: Acq92OFANq5EwVRNHSQUDVYyqAqpaoI3Kegh8EWKT7fYk5B4QJpxQ03901QJsNBEXEC
	HBcT47o6qk+HJ/nuVICcaas+LYe8/JAM9hwNd7VFoPX4K05qLAIUJPrlMgWE0sN55ebI3IiwTqg
	NO1P44F4vcKfEwX/JbQGB9GDRI1i26ri578iCyf7VzDeveFNLiclOIacxU7xMUAAmi7wFOHZ7OW
	kjGphUbydeezbCwyxfnfaQvc3/M88m+6lovVYNDn6U31Qj5WMi3gG9jNHH0iC8T+vNEw63A9ySS
	SGUGfvgoo1mlElRpzEhNsriqROybL87mR0IArN2Yd/wmIBBg0ZEAlsqDKuYa1b7IJ8rghjMk/j9
	cxkE9ObtHXch+QQPJVmnq3108HYUL1fhmGTViAHpvz9qgbTsWl115pxskzBBzWs4hGrPT4x1U8K
	ekdx3RuTDa6MrEeGbqMiDHwicg4lM=
X-Received: by 2002:a05:693c:20cb:20b0:304:cefc:5fe3 with SMTP id 5a478bee46e88-30804a0efdfmr407991eec.18.1781145010143;
        Wed, 10 Jun 2026 19:30:10 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806e8a9f3sm304605eec.18.2026.06.10.19.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 19:30:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 596d152bc5e34b870b32ba3c6d6a766d563ebda0
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 11 Jun 2026 02:30:09 -0000
Message-ID: <178114500912.13182.11973824553700920983@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_193017_071064_F5E83B60 
X-CRM114-Status: UNSURE (   6.42  )
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
https://d.kernelci.org/c/arm64/for-kernelci/596d152bc5e34b870b32ba3c6d6a766d563ebda0/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: 596d152bc5e34b870b32ba3c6d6a766d563ebda0
origin: maestro
test start time: 2026-06-10 12:20:56.217000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   35 ✅    0 ❌    1 ⚠️
Tests: 	 8876 ✅    0 ❌   90 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a29618edabb8c619d43f8f0
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507FDC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtA2EaJrfUAL10NvnwAbetKX7hEHz7uIdxdgCc4AGbQ=; b=pxmyyHWbXEoMCG94BTfZrpur+H
	RtyaKWV8QoVy3OapbQmIPiDw84M7raX/rG8M0vgU7Qsek7HLUUGzeUuccoXTM6EEWihmA466leMgV
	dSOSfNp3Ns6EVSW79ZuxeF47ouOynNxpK4C4D+zm+z8IExe2Fs2jZXlfhdAP6l2++x24IFebF2Afh
	bVSqivzAZHc2pfsklmsKvBeL98NyDd9bHn9anpw7C7nR4vdaR6eiyJSQwF2VRkVtUd9VFRiE6P2X7
	OOUF4Zwgi4dOzcHNna2O078YTbB4SoGa+03YVwAlHNrPp5kumryQzhW9YcOyVuxVhrJql2YmeprZL
	qiCpoC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBt-00000000OpP-3M0k;
	Thu, 13 Aug 2026 09:57:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSBr-00000000OlA-08V8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 09:57:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f502ff678so208612f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615053; x=1787219853; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EtA2EaJrfUAL10NvnwAbetKX7hEHz7uIdxdgCc4AGbQ=;
        b=Nqy/30nv3SIspFX+sOSfLzkKRR9QK2Mn+c9fcKoWemisQ1lTSgig/DH4yUf2oegFK4
         DyRwzZ5nuGMPKeZFtEcEGpOjaX0/ASYga3dIhKmB5g+0y0L7T4GLPyx26CuE5Lb5GZDy
         9DzE8EGs4tf+ttFr/f2bLNKkHQ+qisty0pYSGkreBw4yQ5+XZTtnY7IK97bH+wpoFQ+H
         CDlkNsI2LV8wuEd1UnIYSOwUScU+Hj5awXH2lYBbYXLbQYdq5SawCOMxAbVHaStYLYCZ
         r1areqtOwLV00FQNRsopA0GMtln8GhlIOGi7j1BoH/hZyJPXDJEIqyG8pnHh8qVB1V+v
         Hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615053; x=1787219853;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtA2EaJrfUAL10NvnwAbetKX7hEHz7uIdxdgCc4AGbQ=;
        b=gHiXYzdaeF+BJfCeV11zJV/C86K6vBVEOBJO3WBWoyc/J15xdGRyZf79Ld3+f7PRc6
         N03kd5cjLxrKDoyA4u2YW5Cs6wfuwPOMdsNhaWhnZ2OeOX6H9YgbM1hM44f2qieLTEeg
         SDmxjfBgreO/Shmyjxr+WsUkIJ77SUSHDAB2A8zfkizk/ryhAdyvaUmB+hPXHN/C4P5A
         yz6O/LAWlVxNrQRiY69as0If4pVnq5PFRVf4CjPNsfILx2yYuIa+o5sib2b102oEPLfb
         EqJ0Uj/p1yKS7OVVrE0YsaD8TPYfA7sSgE2FpY3gmnEg17+WdqQgPUcLOdu/r7H63C/l
         kVwA==
X-Forwarded-Encrypted: i=1; AHgh+RpbvxR6NG5gRD59g4s7n5eTLWhwPrkxyqzN1KdEzzk1yFJp42nccOYguXyHJpZrKIc0gKwmfTNZIr+3y55HgL//@lists.infradead.org
X-Gm-Message-State: AOJu0Yze4ZsLIUiXqKSSIAi45tcq5U4U2eVARtUyUQqhuvlxLeaQka6c
	rDC+sekdDEQgIb1q3REB3x1sXJtIVhbJ6Yo7+lfTzDnHDZXhp6ZN4wva
X-Gm-Gg: AR+sD11s/xTlzr1OzDYOytsnJx3o2p+fNC/bIKNVABUg5qWfSqpFqphyP3bzgXwtEzz
	CIxK6sdraDh1hhKgnRH6nli+ga/ExWInIBktvSq10V4CZ7ViZtJmwDk22/4TfYAaoZ67uh1ox0/
	kcZfd+u17ZqIkJlxwXxxwocubUB1siIqtHVXIFoJD7czUEnsVncS/G5LCNlMyAZGIk3Z6DxXCaK
	wD3AleFoJYaydbaOVkMvroJRO1miRd5pOabk6ffD1rFZbTTNpEzjOcatN1E6inq7NSKCUxw09KG
	UPIZkfdDAgDYefP3iqfbMZTOnekvtKQWEsw18DymZbglyr2I8xzo6X9U9r4FLDwKO0DT08ZINPJ
	jJ1qyHfWsG8rKUBM0cemvyXMTFapZatOZu9G322I3xu0/66QnQ2L1gJVpFPLNSQKQ5eQy3DJETM
	/DWste+XXm4ZuQSWReU4Gg2+AWH6mVTFtusGuYyvooH/G2+3AFekH/5ZJUWlmT13PjU9lF7x1Y+
	u83GMmejRI17XTXx9nl3JfllI579Eq99S1p0tfOLIAiTcjlJVTWDnrloNPA77x5x8e3kQ==
X-Received: by 2002:a05:6000:41c6:b0:47f:9256:52c0 with SMTP id ffacd0b85a97d-4815ae93ab7mr2388748f8f.3.1786615053053;
        Thu, 13 Aug 2026 02:57:33 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C009377EE8DF6D0A1C2.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:9377:ee8d:f6d0:a1c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5b6b9bsm4760430f8f.29.2026.08.13.02.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 02:57:32 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Thu, 13 Aug 2026 11:56:57 +0200
Message-ID: <20260813095718.9747-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813092656.2568538-1-gahing@gahingwoo.com>
References: <20260812094106.1391698-1-gahing@gahingwoo.com> <20260812094106.1391698-9-gahing@gahingwoo.com> <20260813092656.2568538-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_025735_307051_1EBE540D 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Jiaxing,

Two short things.

On synchronize_irq(): your placement is right and my question was not
thought through that far. Inside the guard it would wait for a handler
that is itself waiting for job_lock, which is a deadlock rather than a
fence. Before it, with nothing held and both callers in process
context, is the only place it works. I had the window right and the
location wrong.

I will run v8 on the three cores here when it is out, and I will drive
the reset path deliberately rather than wait for a timeout to happen on
its own, since that is the path the two changes are there for.

On MobileNet: 995 of 1001 within one count is a different kind of
number from what this series has been reporting, and it took four Mesa
faults to get there. That is worth saying out loud.

If it would help to know whether the remaining six are RK3576 specific
or common to the stack, I can run the same comparison on RK3588. I
already run MobileNet V1 through the Teflon delegate here, but my
oracle is bit-exactness across repeated runs rather than a per-output
comparison against the CPU, so it would not have noticed six outputs
being off by more than a count. Say the word and I will point it at the
CPU reference the way you did.

Igor


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5996ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=; b=tT9i3L5hiEtOiH3A5w+CjhzUcv
	6zv9Wr7sKhMRrrmG5RJS+4epz5lRia6RfB4vNvzMzAdRuRISmQ9O6JPInA2WHSwXS9qOLh44az2TC
	lgoJ7xWilNQz1r1asBCCH85uYEdVuqd8bF7T1tD9ETk44AyPxC3zc88e2ZvegpEvJf93A6HWRSxgZ
	OqkPaEs6rsh7JAhL6vjuSwkXlq4vcOoYLYa8VpHKW+0D2R21ThufjPOn+W90KQ5BphU86Oq+87MWM
	tlvP8EbpvWTRtrqN50RDzIPOmYz9gox2HsZlM7jMnno53RQH4BvMb0sLgOhuB/D6G7CJHmsRQEzOu
	1sd6tmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgcZ-0000000E5io-1fTC;
	Wed, 05 Nov 2025 16:44:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgcW-0000000E5i7-4Ag2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 16:44:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4711b95226dso155705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762361067; x=1762965867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=;
        b=b/U4VMUoQT5ifINeMrEfRMQqK9jEfD3KOSX/Wge+B1c6t+PAmZNWMWg0z4XuVYxky9
         VBA2OVUjyx5RKEU0PxmTGFgxOvbz7dH4rpFNrQGW4tv/AchIUUq2G/uhQeBBSD8P2BTi
         C8uc5FcE24Us9Hg5fJcQY1IvAaMVQAMv4uWCOwpbnxMMDPpZtNrOR9r9BcaHpMIH76qG
         ucvWvlwAUhGOgK9anga5ZrKGcfA5Zi66T6ptR2IqF7Hfp4SX8unMTzviMzAYMdem3FLb
         ot7U7cka0dM18mouRILcQq/4Wzxq6omlZRhVwzqb+5u/6ulB+4HJa/dpZJpsY82KOHEF
         TqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762361067; x=1762965867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZY2ovksieRapgk658pHLWkUZACRChu2RMh3Rj1+1OEY=;
        b=GXR2nLCpDqIXq+uIy/v0u/RPnbkhViHKFfGraHipn1vJN3N9wPZZBjOVPZ1RFDt/z3
         G9jMsV9hZTMgzX0WkNwHrZ3Oj4u0+SXHWH+6kbGUj+PZrzDUcxmxqxNIWmKucUYUNCmL
         Zx56Mk0RPhrqa9VaGNpRpf3X8xryYRfM1jG1LyhO0dbNNzZVM0DKSbZgFhJCbSADO/vv
         DHPKsiSP1/X6AuMMjmQmr8T4g6IOj9D1YWuD6gB1GRRPoMGI7MW4TBiP5PVUZQ+VGWKC
         4H1Jrla1+SrIFoBOXUK1dz1UgCprrpt51slPA9ytTy0uI2RKnJamEmiCi9PF0Rj8tfuk
         jpKw==
X-Forwarded-Encrypted: i=1; AJvYcCWx9PCr03PhbiwM0NSzNcKikuhSSvHCWqRCpVC+wWhsF1pt8gYqg9UAIcZ+STomlQ534VvDCi2hQTYLO6a2HBGs@lists.infradead.org
X-Gm-Message-State: AOJu0YyA29uf0db2jmJiM6CDQs40h2VVS2MqVVp4eIe+JVe3/fYt8z9j
	MPI3tGKj8osUvqDxiimyoUgaowjAsSDginE8h9bE0N9W7Xf88vLFaBkK
X-Gm-Gg: ASbGncu6YCZXomkMq6ErszW9zoB+V76oDEKPQAkgjeOSfR0slSduVUs9yWwUykAYK1n
	NibQiKPlkUX7x33HRECfzUU9FpZI5YE4mVerOlJAfAmykzNTB1674or50VLCBTRKjHjtatSAiyg
	+FkTDlm315gFM6b5iHAkl1a65ewaxyXsQ+GnFrj6ek4sXf0L6j7aHEBP2QXEPDmOVBcLZrtRxdp
	OT2+GUD5RNXlfOTj8T3V1lGL8Yqidi51LDbSqag1Zn7q7UHQnRE6oay9djlrpT/28DSWTtoLFz4
	OfyPbNfcTNShvM743QsTZiKOVtlvldtbkU5aYUsCGTAcn4IriSptCNK4gb/BCgSvErZIvE/HvtK
	M0akXd7b5/UXu9RDs7ilAvSY0CYtvhNFyrpZE2jBTSBQZqKOY2pPJQFE0iUH3qcnkSI57Lr/TD8
	NKl69GlnPMFQ9/KmDiTNOuYiCqE6lcZ/kWnyiIVsdh7+GupbX7KtGi0v6adw==
X-Google-Smtp-Source: AGHT+IGU8h8RqLt1fJTOpph+Kb6J+YXpLSWNisJ5Rw8ElaLdkndSmhqlDVbaDGVZcwA5Mkqog8YWaw==
X-Received: by 2002:a05:600c:1c90:b0:477:589e:6c2f with SMTP id 5b1f17b1804b1-4775ce1eabamr35876305e9.22.1762361066679;
        Wed, 05 Nov 2025 08:44:26 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1fdef7sm11938330f8f.43.2025.11.05.08.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:44:24 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko <mhocko@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
Date: Wed, 05 Nov 2025 17:44:22 +0100
Message-ID: <12772271.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20251105152023.259813-1-marco.crivellari@suse.com>
References: <20251105152023.259813-1-marco.crivellari@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_084429_093575_DA1D3781 
X-CRM114-Status: GOOD (  11.73  )
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

Dne sreda, 5. november 2025 ob 16:20:23 Srednjeevropski standardni =C4=8Das=
 je Marco Crivellari napisal(a):
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>=20
> This lack of consistency cannot be addressed without refactoring the API.
>=20
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> Replace system_wq with system_percpu_wq, keeping the same behavior.
> The old wq (system_wq) will be kept for a few release cycles.
>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




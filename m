Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8696FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59q2Ntm8hDDix7OEi6C849TzgoK31CLh4d49tbHdyzE=; b=DTxPoqnblyehVyICtusv0vg7pY
	4b1lrZSbKSxJUiVUifGe9tK1W6PCZA9gZLJN/XvVXjdcJXYFCmXwFaejF7Yd7hGhTav9VMrITWAl8
	toeclw0WXiLKFoKlx36agZ6YqV+iwQe1UwO9dklfQfI8SInkXZ/L/GTtbdWMdcElYuNUcekAb5hMd
	MNkRWskzyWEU70/kBpPUUKrcA8SzP4Eo14bC9rU/gYKPcfyQ3eK/Bk8hpR/I2xBDhns8WknrLbAd6
	m5YH4rUAczRKMgKQ0tAtIXXj+FAXt4pWIGOu6UTgX7SmzuWvEM6Ec0yIXwEMhmBFgcet6KP67mUod
	qW6yZtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhCw-000000053YA-0GHu;
	Sun, 16 Aug 2026 20:11:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvhCt-000000053XV-09M4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 20:11:48 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cf452def93so29217615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 13:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786911106; x=1787515906; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59q2Ntm8hDDix7OEi6C849TzgoK31CLh4d49tbHdyzE=;
        b=Uw7Bf2H2c0wwJzbjOBAqEOkPQtBdTINzdkObjQIEKIsw+q300iBmuKEQL4bLwQLyFv
         IBdFXuoOTwxVOjg1L6BwOPk5NrBccnHXZVEqe+2/oZmYkgrFhRJU6b0pEXY/5b7Bmj2h
         kKVuzZdSA8tcJvbuDg6yAS5VwytPUY63tkxC4zEenrao2e/N0TwGmzqiARvDhuV6t9ag
         6of4NIozA9rnZ3b1hT+4pP8JgsJ9OtSepVBR1CYxHMYrTR+6e9uW0ibzKVVJexS9tx32
         EMkytCAelEIVNWLdbk8ZsmaHPEt5aCfVUEsfzQnNUCmXebGxq6W5EWysyXqPFrfebBXh
         m0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786911106; x=1787515906;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59q2Ntm8hDDix7OEi6C849TzgoK31CLh4d49tbHdyzE=;
        b=sdHCQqU6SCyPnFHFg1D+qC3zqOcQqNauQ4OaiRmTLO+Bu2Jxylm4rA8AdDclXOD5Wp
         LFV60UFR7hr9aAhPOf3gi58H4Fr8vIRUmGshfOKjSGp+Apt/0odF7RJFUxEnaOkhkDFE
         guHCXSuzHeJ6743XV0AhjDaftp9DmkrMQYiD36F9WzstaB/nipge+bu+5enGUGiN/nkf
         smWYhQFWmESP016xCBQTW3NTd/JJmZ13VV+Jd6EL6YqcZ+ABDqm6NPynHUndpNGRdKJm
         4rzvIANj4p4J1uSaANxr8k6GwYJtUA/IkfosJEJwEw8dR6yKUvGUkLLODwCONbZ6B2AD
         CyGA==
X-Forwarded-Encrypted: i=1; AHgh+RoJ6aVM3BoN8T1QAzwiLE5aHVbJqUrCevxqcPRw/+Ane1fjI7kOe5P8F5dQmjsOUdQEImQg64AYLP+Wrc/ewOuV@lists.infradead.org
X-Gm-Message-State: AOJu0YySdzLwrvQJGV/bWrhrbh9aWnggduWYJYkA5TfkXKzpstulqjDA
	L90RckY7TwPmG/vuglXewMsJ/WWIWe73/qfu91wpsiehfQ/tdZAkTqpNhoAxmn1+KKc=
X-Gm-Gg: AR+sD13kubkHR0o6P7L0rZklICfdIL6GZ+ISI8xJcr05apXYyWFbv1M3ByLZUjM+EU6
	FAurDYC+yjdhUZwuDq8zL01g1buFqrT3nTwR1Ox58+4TBSPpqJelk221jzJJx4QwY/i8XNUSSnU
	MU8CewdG4aIhHMn2l0VqYTrjvmzZBPmPT3jaZRhyJ+T+G/Ia4hdZhRjvURx2XAaBFZz+NkPbbn6
	MpQcTWTRMk0p0Y8T8gIyO0VNiLP0hZJB4Q8cZuv2Id0gUJjIOjZPmohWUZMmKxefQS0eLQO+ll0
	GRWiBflyoTwCbW2hHeLjRlmCGcCcgz9ViDlKbd76flJ3G0j3B+fZkWrbTsE+jgILI8ZpyCyaNvi
	wDg+XdP5w+dDXKwuflDadZpNrpByEeHknjRd6NqGHfnOsrTOPE3m8gkeF2hS9mR48BjIwafNqCM
	9HL8ASEs19qWA6wgbg76prO4Fxl5J6BV7xJDZZSgU05nn8JHWPahkmesco8h8n
X-Received: by 2002:a17:902:ec83:b0:2d3:7122:833 with SMTP id d9443c01a7336-2d37f7c3e97mr280281825ad.15.1786911105661;
        Sun, 16 Aug 2026 13:11:45 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9679sm30354640eec.3.2026.08.16.13.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 13:11:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 16 Aug 2026 13:11:44 -0700
Message-Id: <DKQN4CNOESWV.2XRL8DIC87HYA@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: xiic: restore runtime PM teardown in remove to
 fix clk WARN flood
X-Mailer: aerc 0.21.0
References: <20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai> <aoHf6UDxD68YxLYm@zenone.zhora.eu>
In-Reply-To: <aoHf6UDxD68YxLYm@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_131147_091612_30B8303D 
X-CRM114-Status: GOOD (  11.82  )
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

On Sun Aug 16, 2026 at 9:14 AM PDT, Andi Shyti wrote:
> Hi Abdurrahman,
>

Hi Andi,

On Sun, Aug 16, 2026 at 06:14:08PM +0200, Andi Shyti wrote:
> isn't devm_pm_runtime_set_active_enabled() calling
> pm_runtime_disable() + pm_runtime_set_suspended() +
> pm_runtime_dont_use_autosuspend() at teardown?

It does call all three, but the ordering defeats it, in two places:

1. Within the helper's own release, pm_runtime_disable_action() calls
   pm_runtime_dont_use_autosuspend() *before* pm_runtime_disable() --
   i.e. while runtime PM is still enabled.

2. devres is LIFO, and devm_clk_get_enabled() is registered before
   devm_pm_runtime_set_active_enabled() in probe(), so the clock's
   clk_disable_unprepare() release runs *after* the runtime-PM releases.

pm_runtime_put_sync() in remove() leaves the device RPM_ACTIVE with the
autosuspend timer armed: rpm_idle() falls through to
rpm_suspend(RPM_AUTO), the delay hasn't expired, so it just re-arms the
timer -- runtime_status stays ACTIVE and the clock stays enabled.

Then the devres teardown runs. pm_runtime_dont_use_autosuspend() clears
use_autosuspend; update_autosuspend() takes the else branch and calls
rpm_idle(RPM_AUTO), but now pm_runtime_autosuspend_expiration() returns
0, so rpm_suspend() no longer defers and suspends immediately --
xiic_i2c_runtime_suspend() clk_disable()s the clock, all while runtime
PM is still enabled. A moment later, further down the LIFO chain,
devm_clk_get_enabled()'s release does clk_disable_unprepare() on the
already-disabled clock and clk_core_disable() WARNs, once per device.

Calling pm_runtime_disable() in remove(), before any devres release
runs, closes that window: with runtime PM disabled the helper's
dont_use_autosuspend() can no longer trigger a suspend, so the clock
stays enabled and the clk release balances it cleanly.

You're right that set_suspended() and dont_use_autosuspend() are then
redundant with the helper -- pm_runtime_disable() is the only call that
has to happen early. So for v3 I'll drop those two and keep just
pm_runtime_disable() (with a short comment, and the full reasoning in
the commit log). Does that work for you?

Thanks,
Abdurrahman


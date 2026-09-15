Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BADC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4hpVw5olr3BOvTW7xqRJYBtiWyBFRu8JlWAQLn4pE4=; b=W+ru3A4ko35tJ1d3Wlm+oDAWxJ
	E4CHY0kjgfPMBRyVh3StiqsO+v9vlzu/J/SCuFQQzQgSVDXs+CDpOYNdny+m71AA/JvB3xjpcANgI
	0gUFJNvfeuhe2+s7IZZ1RxAjnVO0RBr0d7Xt/HLis1ZuJHUxsPh8Zkq+BFc3eWB8IRobz+5dmJo4o
	0lo4bmsgIjTzrmkH2pNcoJcerf+1TD5/yrIN82s4HbYBgTtbVyH97h3gr1HzRZorXM3EkUrZElIWo
	qPtXk0zsNx4QqxMm3G/a+J7lfxZ0bL1lplGEUpZFAynBm6BKw3al2Pigq5Z5elcio2H6C+uHBk5OM
	SYgNARQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S1z-00000006QOo-3NVD;
	Tue, 15 Sep 2026 12:12:59 +0000
Received: from relay.yourmailgateway.de ([194.59.206.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S1x-00000006QMG-1Y6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:12:59 +0000
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hkgrN6ls0z4RKN;
	Tue, 15 Sep 2026 14:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789474357;
	bh=gw8YgWsYGT7lofU04wNq0RsE/wO4Kqm6A07sl/aqbHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X5pW1zjCo4C1yvF5uU2SDe5awS4ZJsVVyMc9nYCe0hYcop1sIpbtXLwJz+DBL7W5w
	 Vim6RriwEvJ/1DwQoAkV/8nzymlF85q2Ue9l8XkC1I9BL3Ae8OzaXVnwLIz0O/sqqK
	 If/4eUtiMRQ4N0KX7C73CYkGuwSLE8C3SWJBCjoej7fRR78wK+jNPUDcS4tXZ1QHCK
	 L7Xt1VLK7afM5bSo888qEPgovD7/SkOsfNQqi3dR2au9q3oSNhmRlXcZFymqzeniQF
	 oLd3CnSRtNBW/V0SbQlXwKfDS1IBrp58+UGSq7bz7BI+WvcrdwAX57gu19MfSlZ++N
	 2Mp4zKOoEmnPw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hkgrN62smz7xkH;
	Tue, 15 Sep 2026 14:12:36 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hkgrM2dx2z8tJf;
	Tue, 15 Sep 2026 14:12:35 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 7F3425F9C8;
	Tue, 15 Sep 2026 14:12:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
Date: Tue, 15 Sep 2026 14:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
To: Marc Zyngier <maz@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mostafa Saleh <smostafa@google.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
 <867bkw3zic.wl-maz@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <867bkw3zic.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178947435100.1590392.4866281565346045528@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 7F3425F9C8
X-NC-CID: X8yQY5b46QOGgkRC7KMh3x3Dn9ay1/I95uA+3TcajQiagkk/Udk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_051257_786041_69B46FBB 
X-CRM114-Status: GOOD (  14.16  )
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

On 9/8/26 10:42, Marc Zyngier wrote:
> On Tue, 08 Sep 2026 08:34:18 +0100,
> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>> On 26-09-07 22:15:09, Marc Zyngier wrote:
>>> On Mon, 07 Sep 2026 21:21:44 +0100,
>>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
>>>>> Recent addition of QoS configuration to the X1 variants resulted in
>>>>> systems that spontaneously reset at boot time or under load.
>>>>>
>>>>> Given that this is both very unpleasant and hard to debug, give the
>>>>> affected user the option to survive such event with a module parameter.
>>>>>
>>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
>>>>> offending QoS setup.
>>>>
>>>> Lets not start doing this, please.
>>>>
>>>> Can we figure out which platform deosn't work and then maybe we can 
>>>> add a quirk in DT per platform?
>>>
>>> We have at least 3 machines that are dysfunctional since [1] was
>>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
>>> going to be the one doing a survey.
>>>
>>> What really should happen is [1] to be reversed until QC figures out a
>>> set of parameters that actually works, instead of making this platform
>>> even more unreliable than it already is.
>>
>> I'd rather have the patch reverted than adding a module parameter which
>> users might not know about and distros will probably never addopt.
>>>
>>> Just like [2] should have been reverted.
>>>
>>> Until then, we'll have to paper over this stuff.
>>
>> But a module parameter complicates things rather than just papering over.
>>
>> I suggest we get both reverted if they break existing platforms.
> 
> We're in violent agreement.
Did anyone submit those reverts? Doesn't look like it from what I see.
Do we maybe need to poke the subsystem maintainers?

Side note for the record (noticed it just by chance): afaics one fix for
[2] was submitted meanwhile:

https://lore.kernel.org/all/20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz/

Ciao, Thorsten


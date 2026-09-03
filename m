Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E75C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=; b=XGYeelOG2cWQ58liHlffo/UvK4
	UuIsBgBk6D9B66QgXA+fIELPw2iV//y1C8C2JEeH2tkvxzNiSpraTjOudU78vWDM5f3a2gG2ccbeS
	jcH7xqgn1qeam+UHTJv8QNy+laD2ohNb6d1tbTCcBP84alr04CAkUwofQFD2+icZeUYPg8yMNPsc8
	aUb9ByWy33QeNRcLWX9afYHKsTUY07qRzo/ZnymRQx6+PE4pf2kCStvdYyKSFfPAeOZK734R00uqs
	wBgiMIgXhzzGZPLiQzPI5KkJ/01r3vvvkPdMxj0napMCvYE1AWwfg5LNh7i1JiULQQVoEqhkzfcCm
	KJ7wqHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x271r-0000000HMjA-3iuS;
	Thu, 03 Sep 2026 12:58:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x271o-0000000HMiD-297x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:58:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso16804335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788440330; x=1789045130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=KfW0BCOUKBL0QhxB+zHqIFqWIcCwwGE+QIPrrP+7/GF3BbOatWZTTdSFOxrdbBg3GI
         saFFF6qNxKO7hSTFBCs1g4QGI3HdR79fnxUjEb2+2nMsGJC8tVduDQiuRooa9fA6R77k
         vzcH/6ybauoclfoZMIbNkuqcwNvAtGWSY3Xn2xld+wSQUTTiXctpRhs/67FRv+qAW8F2
         rHV9n6rPWRPNsj2vxcSWrVimWZVetTZ7U1PdRglllO2Qkfg19WASqbCsfOV073zFlHZv
         Ju2rCb+RsVn885Bsf1YfSLKMprww7cW/hZoeDt9j2qI3tzjSx/WAf1Eoqekd7+G6zrEQ
         msgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440330; x=1789045130;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUOhnrIRug8NhLOWvB+hNSnIHP5x1LfuWaznHtYn7Ag=;
        b=qYsC91Nf/Q3C8k7NrnrFpqC1NjypTagwe8zpRKdKKeaN09NP+0LDRn+Zbgm9qKUHyI
         Dwdo1B7KEFAubEjGcEYS+B6DdxxnHQ2YrQdFBzXDq5wn0mChcYOpBeFPNBfA86hg8jRU
         X0VPJgSkCjQ7UMiWtopGCqd5Ta2vg4H4aXUE0RYb08kVWIPTg04o2GFXHh87hnyP9zJx
         UJMPTtIH5OqqYB1f7/v1I3U+Sd4FbHlD9nDjhJr3YXmwcpOauyoGGrHHRWWUqppXh8S/
         FZ6aLd6V1D2E0wMVE7LQdc9DB6oKCezzOIcDbzM4Bq55ub0s9R/gyO6AluCdej7C6ohx
         5Osw==
X-Forwarded-Encrypted: i=1; AKwUvByuwpaGUWvQ7QVuu9ciAVGwVjjjn0uh9NiiYuQQjP2KUdoEE/oB4V6Lx+KsWBBfXUkup1s4Sd2hyuuMo5RngU/Z@lists.infradead.org
X-Gm-Message-State: AFuF++ksf43w3rn7wiFqL4V2bzLKPtf+yXC74OaM4ZoTwG+du2aPwCSo
	QUYnHusszrAXjJPywH+TkfwFw7yr4ZVE41rPgRV2DRNS1Te8UWyxFZO7nPzn96Ra0yA=
X-Gm-Gg: AYBFou3r5z++6tpamtCyEGWplYZyXgXP+dUzp8D9rhbszPkuf+oDWfbF8edqqwTvzuG
	88Wo1wxpUYeyXfJcq910tmPsQh9lEDdOb5OQYFqbNbAjLOUciDtSnFC/Ho4tRbrY9geLwK+4Op1
	CIeMj7PGypCMoK2H1Wx/cpDt4QMUQbX1HZb4/52Set0XD/n9VClh6WsY34X/dCNL4yTslepO4zJ
	h4AJpkY/FzzxS+eTRi//CDOqVmhf5eGpk4O5pj3qWcmMaXcX9mpJbbuVP+hy8wdg9GpAjEjfftS
	MJ427xPW+XlaT2iZ6h628dIKQVu588pDVjjwzVAUQ54iZTthjpEPFovksKEHncmoz/jSvr+I7JB
	bf2kNm0ReudMPkyj4vIt0qjg4lBGa6FsvncP/CUHFzdoog4t8N/okIhfPFpnCM6E6LDIx5rHS3N
	6xIhtjf1Iz9q0aB/8Eh7XPgjYcODkDQ+AJ7WvWbRsfuQkQ4EuoHt+N2pbxCNb0yfCKip2nPcfVD
	uWgo4Y=
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr225433345e9.4.1788440330042;
        Thu, 03 Sep 2026 05:58:50 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023edsm67989285e9.7.2026.09.03.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:58:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: tanure@linux.com, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Jian Hu
 <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, Brian
 Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
In-Reply-To: <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
References: <20260829094758.23248-1-tanure@linux.com>
 <178818026093.2318126.3676223463693214854.b4-ty@b4>
 <CAJX_Q+17CLQ_4-rcj0KD6kzPWnChQfD3irCR7-h1bGH9hWiD7A@mail.gmail.com>
Date: Thu, 03 Sep 2026 14:58:47 +0200
Message-ID: <1jecfa8pa0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_055852_557614_D3CBB809 
X-CRM114-Status: GOOD (  23.05  )
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

On jeu. 03 sept. 2026 at 11:05, Lucas Tanure <tanure@linux.com> wrote:

> On Mon, Aug 31, 2026 at 1:44=E2=80=AFPM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
>> > The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without=
 it
>> > the board hangs at random, loses storage and corrupts memory, and the
>> > failures move around from boot to boot.
>> >
>> > Six of the SoC's PWM outputs drive the board's voltage regulators: the
>> > always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. No=
ne
>> > of them were described, so Linux saw the outputs as unused and switched
>> > them off about a second into boot. The regulators then drifted away fr=
om
>> > the levels the bootloader had set, which is where the corruption and t=
he
>> > random hangs came from.
>> > Thanks to Chuan Liu from Amlogic for helping me indetify which clocks =
are
>> > critical.
>> >
>> > [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlog=
ic/linux.git (v7.3/fixes)
>>
>> [2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
>>       https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa60842=
478f2ae
>> [3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
>>       https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff5=
43cc696
>> [4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
>>       https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b=
7e3ba3a
>>
>> These changes has been applied on the intermediate git tree [1].
>>
>> The v7.3/fixes branch will then be sent via a formal Pull Request to the=
 Linux SoC maintainers
>> for inclusion in their intermediate git branches in order to be sent to =
Linus during
>> the next merge window, or sooner if it's a set of fixes.
>>
>> In the cases of fixes, those will be merged in the current release candi=
date
>> kernel and as soon they appear on the Linux master branch they will be
>> backported to the previous Stable and Long-Stable kernels [2].
>>
>> The intermediate git branches are merged daily in the linux-next tree [3=
],
>> people are encouraged testing these pre-release kernels and report issue=
s on the
>> relevant mailing-lists.
>>
>> If problems are discovered on those changes, please submit a signed-off-=
by revert
>> patch followed by a corrective changeset.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
>> --
>> Neil
>>
> Hi,
> Please don't take this. I will submit a better version.
> sys_ampipe_nand should not be critical.

Please submit a fixup change on top of what you've already sent, with
the proper 'Fixes:' tag.

>
> Thanks,
> Lucas

--=20
Jerome


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45EAF4382B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=; b=DyVxW3WO8def0GfnKk7oa3iH3d
	kCblgbqs61C5lyMQESCV/VwXO7vLJ4ykY1X/nXoG8mDX3+cYVeqTba8kcwRqKFXfvfEyhGu8fEA2E
	QR86Wfw1giyCily7P7SveWSlyOUPgQVhFlwXZg7WTH9od7nZJjQP100lzn1sTTU4pIt7dq04URTvC
	RHM1fdkXmoBnulqJfd8kpsKQozw2LeQMMdArVZ6ZMapUWTd4Zei7ENACpMc1dToW/2S5B33MELJXt
	Gpp1j7wuRT2m1ofMH8uhoZe+t4GLwAokKlRSWi88LVaJVI+Rrke2SK9vata9bi154eCW7RPT/AjUN
	1LrAu3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1IU-00000001F84-1Oiz;
	Wed, 15 Apr 2026 14:32:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1IR-00000001F7g-45lY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 14:32:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso81282525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776263570; x=1776868370; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=ey4BtRd6v30cWK/EFENIxfJxTIuDd0HNaUcmGpx3LoCD3LyM5YTVRRhju1VzBbB6Bs
         J/HFInfHpLZTn5ah5o++7PMu8kj75BEGKB76zQxfVaTxCEPdGUtmAkuKrA0OWTu3xmLV
         zRHQ2/RrYkVh67nz53goVzkDvpnHd+oSUelcmy2XVQ40HcM1MHBLRWADLccmbQkh2S+H
         nKZ1aFKGZJLaoXBWhIEIcL041FxlPYJ9MOMmQihT1u2ktqR/x1N1pcGK3fNai2tH3Eki
         yE05VEgzu0HO2iBFUgvHYeawTyExKX3zsXt13U1QCt8OMowp0vVJLtNgd3d2e2GarV3A
         dXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776263570; x=1776868370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3HepdRyQzPaOaFk8Iiiaa5QdNKTntj32oiu0bvvizxc=;
        b=PgKMB51a37FGr6pHBwrEqohwC+BBRUkl60sfqHwAUbWenIoxZZGnPbnX2f1rb4W97V
         W6LXSkq+DXA0cilKoUp02axnd83jms5IXyFd+NeVaM9T3K7a1KkD6MdP0YLQ/aQuGUyD
         1GbO+gy7GJdvvfv5R1X5GsYWgkNOb64hekwXcgIf2pfqJiWaHnxxrnW7ZlfBoOYwNmKp
         808xwMqPdN0ewq9B8rWWlj4QtJzt+weX/X90B7+jeey9ivG8nUBK9CgcMm4FduRs19G+
         7hvpeGtB56MnJWUVJGwLkF38A2rwEjjjVlg7n1NDmj+/11WE+nSgzkDsZLvFXE6Ld2ve
         u+nQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lqWqXq9afNAIug8f4HPJ3SGLNQ6FuYPc6/Lx7sIDbP6nyfjdKexCPbP13OWRYG419prH1L3UPakuXwDqo0THo@lists.infradead.org
X-Gm-Message-State: AOJu0YzJgPGOFoVLFszMV0/Rmqwpdw9vNpIb3ITqSPhmsqiXv/pHNS+O
	B81aGAAH7z0ycvjwjO9oT/k2KOgLhHC8gUFTckCIe7Aps4a1poWp7d1wRzV7o3jW1Sg=
X-Gm-Gg: AeBDievFbleuejqbJH573nWBjvyWCbeiSXJXZW1lQGBuT34f4nAoKCMNmWm4k6bG8Ll
	BOxx9Qjii4xXdmYICZZYaoFREpxMGv4cyHxW0v320XZu5F6Ir8OX0CCOj72d4CSk2b/Vz3aAa/a
	L4MgRd+OfqX5ss1dAFvUntnUyfJh5UBLs7Y96pVF2l8YQ7mFIOpnpY2FTm3DnBjPe+wkbaMKI71
	IKdWrVIPi/hO3+5dGKtgVIxtdnZyiMcnbilmLHH6D3QTO+xZ5+GbKG/OjjJQDE11khqKJ/llTI3
	xSVPxw19NX9xgPteekceFUjfKM6UZuHtvNJ3x6iplUhYS/caw3/Z7dxtsnCstz/8gPYR2Vc0lG3
	t6LizuaaJshgT6sfFC+xZz6pdTJXCsNSPxzePFcW0rROKX0owyR//LyUFc9u7PWRV7oCWNtJo8X
	4DM7D+gY9DAfQokBbvzJl9r1wC5ciZEiToPbom0ZgM/3i4hiPYRDR5YHtsjA5+iBAYPwOa/Eza/
	0X4kLLkZNA5Q044NQ==
X-Received: by 2002:a05:600c:3149:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488d68432f2mr298691635e9.15.1776263570072;
        Wed, 15 Apr 2026 07:32:50 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f4352900sm2651745e9.1.2026.04.15.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 07:32:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 15:32:48 +0100
Message-Id: <DHTSVU4ZU568.2BCATHBGQMAWV@linaro.org>
Cc: "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo Choi"
 <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Sam
 Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260321-beautiful-garnet-magpie-de4fbd@quoll>
 <DHIB5E66SP7A.110YA5R1OOQHS@linaro.org>
 <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>
In-Reply-To: <5d645bb0-22cd-4e96-b8b6-15c4bb83d87d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_073252_035551_7C0CFEDD 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu Apr 2, 2026 at 7:43 AM BST, Krzysztof Kozlowski wrote:
> On 02/04/2026 04:19, Alexey Klimov wrote:
>> On Sat Mar 21, 2026 at 10:44 AM GMT, Krzysztof Kozlowski wrote:
>>> On Fri, Mar 20, 2026 at 09:15:12PM +0000, Alexey Klimov wrote:
>>>> Hi all,
>>>>
>>>> This patch series introduces support for the APM-to-AP mailbox on the=
=20
>>>> Exynos850 SoC. This mailbox is required for communicating with the APM=
=20
>>>> co-processor using ACPM.
>>>>
>>>> The Exynos850 mailbox operates similarly to the existing gs101=20
>>>> implementation, but the register offsets and IRQ mask bits differ.=20
>>>> This series abstracts these differences into platform-specific data=20
>>>> structures matched via the device tree.
>>>>
>>>> Also, it requires APM-to-AP mailbox clock in CMU_APM block.
>>>>
>>>> In theory this can be split into two series with correct dependecies:
>>>> device tree node requires clock changes to be merged. The suggestion
>>>> is to let this go through Samsung SoC tree with corresponding acks
>>>> if it is okay.
>>>
>>> I don't understand why this cannot be split into two seris
>>> *practically*. What is exactly the dependency between mailbox and DTS,
>>> that it had to be combined here?
>>=20
>> Do you suggest to send 3 single patches with proper dependencies
>> description? DT bindings change first, then mailbox change that specific=
ally
>> depends on dt-bindings change and then dts update (which will depend on =
both)?
>>=20
>> I thought that mbox driver change depends implicitly on bindings update?
>
> Please don't answer to a question with a question. Actually three
> questions. If you cannot give argument why there is a dependency, feels
> to me like you send something you do not understand.

Sorry. You're right on the first part. Couldn't say anything about last par=
t.

So I saw series where DTS enablement changes are included in the series
after changes in drivers were introduced. I guess it is more preferred
to split out DTS changes (also considering that kernel without these
changes should be able to boot with new DTS and vice versa). I can split
out DTS change(s), yes. There should/must be no dependency. Thanks.

Best regards,
Alexey


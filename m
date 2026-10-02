Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B582CCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oB6uuf7VoohKopZrnyhzVCpQJkf8UgNj4/ls4gHl8RU=; b=aXvlxZoNBhGXxbrFmbiZIhscEm
	0iaKu4LxJHMm2rnzCSLYxekXQ0RzNmqcFx39ij+njFXY3rbjlCWQVnp35DroCMgmcCWHhQgGlzPiI
	ncDbxzt37ikIHAgeQ4ryT0qHsYF7Bw+VuKzGEac26kQdc3HyGoMkC4x1rSzG5olV/1Okw8XiLdrmp
	oUePPsE5k+KxPk3JEMcatV+GYTYJWHWPi8n2188i3uIR4cT9Gcow8t7phK17Kv8Rx0vcRmng05e0b
	i/a01kmOLYS/Qvm0Ag4TMRmV3Sul7RJNIVJ/dxyaEx2rhoTfwmRnAE8jrzljlwnAMjX2VVlOveK5t
	12+sta9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdjg-0000000Bhvf-0mBc;
	Fri, 02 Oct 2026 13:55:40 +0000
Received: from out-74.mta0.migadu.com ([2001:41d0:1004:224b::4a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdjd-0000000Bhtv-416M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:55:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NxRWmaItSzHiNP+iJ+lnvfwn/WnhlxFvjpyIKAD7kDc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790949333; v=1; x=1791554133;
 b=XrvsKZpUREzL3059CrG1C69DmXU3HpXU17F+E7xWdOKQIL4YYY4eR9lkiG7+M4Mf3IFwka3w
 9HHJnhOUJLQEXA+92KnLoFZsEy+yIY4ltVPEn9ZoYfje0ezQZgumqSHsal6sb5x78lEV3O7L2sJ
 U6IsiV/3r7pGwzzkzql7/4NE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7879b3caaaa66776;
	Fri, 02 Oct 2026 13:55:25 +0000
X-Mizu-Trace-ID: 7879b3caaaa66776
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba4065fa07so8300e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:55:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjDKgHcO6WYDLew6ewdaIvnMBq4rIFZ5///nJx0mt4NpzZmtIR301puBboa4RmD/691jqPgSv6DpNXHJSF65pZ@lists.infradead.org
X-Gm-Message-State: AFq9FYKTBPLayz7AWJc550rDQDkXbeTKr9dt8tGWNLGZcmS1Nj+L7gOq
	x7QKTg7R7lQcGWzY7RnXWP3cysh10v9BB1kRKBg3kWncRRmArPYOAQ4ZJ//xDLAf1GJixx9Tu5F
	xdslowdjt+uZm8p9S2rFMOqhcQU2Kj9u2SINYJmly
X-Received: by 2002:a05:6512:124e:b0:5b4:74e2:4171 with SMTP id
 2adb3069b0e04-5bb7c95878amr126055e87.4.1790949323822; Fri, 02 Oct 2026
 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev> <ar-xtsSOqwWK9jWQ@willie-the-truck>
In-Reply-To: <ar-xtsSOqwWK9jWQ@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 2 Oct 2026 14:54:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
X-Gm-Features: AclHuK8F5q6n8ZekSRW4HmigvutSZ6LtavhLlT8nBy_1uvzPoiEI4YC6OWepcRo
Message-ID: <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, "Rob Herring (Arm)" <robh@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_065538_138537_425BFF4C 
X-CRM114-Status: GOOD (  11.45  )
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

On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> Are you sure #8 is the correct immediate for the ccmp? My reading of the
> pseudocode is that it should be #9, but this instruction has always confused
> me and I hate the fact that it doesn't take another condition code mnemonic
> instead of a raw immediate value.

My read is that #8 is right. From the CCMP (immediate) pseudocode in the
Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
and are only overwritten by the compare when the condition holds:

      var flags : bits(4) = nzcv;
      ...
      if ConditionHolds(condition) then
          ...
          (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
      end;
      PSTATE.[N,Z,C,V] = flags;

So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.

Agreed on the raw immediate, it's horrible.

Cheers,
/fuad


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F0FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOtx5Uo4a/i9Sp4XrnBY2y5AeFcy0ZPNgohX4nU/9DQ=; b=eWgVYMRw0xrJtELnCsJjYGLVzV
	7TSLOIbynpVfbZ1UAJXzfW1yX8lhyEJlqd7d+2ozdBH5Skb5jXt1xEG5kAFkHjZrvJv6KTmChacXm
	Q5UmePZNh+gtsiGJUPwgOWsEjt9F5r7qJ6d6vi+s53JSDTrBtVC0RzQV2CREX3dnbF4z9J1UcXQaU
	lFn6gDP8jbQz28HyaetKDOw/vi0agqqqI0HaEGnxxS20tZ6s6sTAigxNX0hEY1ktOaBoNVFWfFBCX
	0TV4+Eum9ZrfMproHVb+PLKcMSn3qENkrZqmw+M/eq9fHHTGMtIogn4cIuz84oGCon0RLc7NZ7tGv
	JCEdLd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyTw-00000007ewH-30HL;
	Sun, 12 Jul 2026 18:00:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiyTt-00000007euV-2jME
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 18:00:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8485b358552so2587991b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 11:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783879245; cv=none;
        d=google.com; s=arc-20260327;
        b=bX414dzP6DiQT6tz4knZVW58uGBPijDzHcWZQ/7HTUZBY7j7fqI2oNZ4+eEvB6KAoN
         n+ZRAq/AfoUZuVd3KyH3gFL0ahoxYMvF3de/9x4mRQWt905bqCL7BgnUyy9k0Kp9ApGn
         n37TCogA0chs+1F/xBO951OyJ+h7lMa6mt1ripwseM8Ci+fzh/ai+tYkq9pRgTHXioBq
         l8aMfjY0Aq5VANz3sHNzr5qDY/2nkdfP8gH/Ql/pIDkj9qvTH3n5Tk2mbi1izu52dCFc
         QHbCDNLKukiBS7P8RXwZFIy6GZJutLri4uf273x2XAOjvowAxx8DXv0r8RnlG+Rkioyz
         jBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hOtx5Uo4a/i9Sp4XrnBY2y5AeFcy0ZPNgohX4nU/9DQ=;
        fh=9Zf3z75mNs//p/u9X3jiuEqjfdrbEwTPMQ7Cfn2cg/4=;
        b=YSK2AcweEeSsvvU24aVq8awzA5C9kyysa7GZ8EoPd90gpVGRGmiTa4Sc+qXirjYDde
         4+zoCWlzkAJh+7OBw8+A1x+f9n13Z6jMTcO3TOGMQ25xh0Uo/0oMRkH/kAkmvZPmITGi
         rrv//4Gv3yNqaNPWPG+1uD04QezNaT2NHi7Td6TeUAG3FxDv3zB05S1XIjFme/58JNri
         Nl4JdLOhpPesWvdtKQTWrBJc+S4BOwYQgvplT/S70ROVfoYx53wsyL3l5TYEKxKEmA8J
         YBMep6xgLZ2RPHoxCPKfg/HgPHM0k5hxioNn3E2SHfA3sVgN7H2wnBFAuJ7zOOBUQmX1
         kfeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783879245; x=1784484045; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOtx5Uo4a/i9Sp4XrnBY2y5AeFcy0ZPNgohX4nU/9DQ=;
        b=LBVZnBfAx5Byk58Nzo25cVQ6sZwbrMK1jPMADfhZEzLVDpVqQM9P/nxNWYQsOUpGcA
         RCty9uzFQjtQLxoEzedVUH9yxTaMOmmcvgdpVL8Tfkl4YjlLaEqDcJETF767HbbHYodS
         uNs4kB3EFgOX7QIWetF1XeH0AR3Z6nKBMd3DkMh0aDK9hpAUZhmDX5JBw0rCBV2SGqNd
         Ne3UU6M299f0zhJc8hIQ+XWUaRTQ1wuTVtHkRReTaeRd0aSkvKAxmr7k+5gWH/m4S2qg
         +RoajjrRqIe/HUrTj00pEUASSLUT2uK+Re1SgWCR2j1zj/n92kaSNcdfnesueJLpvB6+
         ApNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783879245; x=1784484045;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOtx5Uo4a/i9Sp4XrnBY2y5AeFcy0ZPNgohX4nU/9DQ=;
        b=I9hBwea5Y/KxvcgjXivyLhvZko94TUSa0o/hc0rYVMiT1JDsCd9QKEJn7MVEgpxYEm
         xYCTmNX+KcJ/E5ZHqGvYWDKlXxq8RlEanDeIWiYu/AntRSr+vhp+xbneGTEtdEzXjPNE
         Ofa1G+rBYFZORw/GuVibjo+o/zyMCpWuYAu4yZl5TTXBW5LAeWDL3RhUqDKwBTcbAC3i
         zhFc/P2s+izYz/IcB/jtfLdoK85fGRNy2oxvNlO/BB4vPtD/GP5ogK4SHp7HDe1IMx8n
         1tGG1qyQ8Pb/lx9x9597Dpzj3JpahOtlPGNb/9sDSYYlxzxAtZQdewU9NQAfXTRnPvgA
         YWQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCSEY8VL36UuOFJ5s3BTmN05QL8S9oOfun8G7NRVqWQHMCB4aUBnZkZpdGq+uqAvlHqQfeZRT2rJ7f5PhYaaTU@lists.infradead.org
X-Gm-Message-State: AOJu0YxwnhKeZkOrnRInOgSPm8DNlG6gVTQp+BY/NiCANxM1VRzOqgeI
	hJgV+J8br8p5qbmWua9Bs6lTnyQ0o+xFqxx5U456fuwXFV8eYXk7vJ/iWVNYuaePVWHAvLMNIhT
	9xbp+5/Yyxr87j+BnABMuFiyE0eK3d8g=
X-Gm-Gg: AfdE7ckkCxrevOJ4gaUVxbFS7gZ2MDDU+/2kbIuA2LS+JYpXQBQcCNDkG13oWBj2eXT
	VR9FFmTOa2su3XOMaZPXsVpi+JGIxg1feVF3Lg32cvgYdtydd747Bw6ENp6A7Ncp8BH20hi4vZu
	tXj7yLd1/CG7jisBEJSWCmSrGpItBTCGZVDf4Rkc0bVXuGLZ2tGdOvyi/+y3M9sptUyL1+p5lkA
	dagv0OQKMoBu5L9DDyX8SDq6rwFPWlPL5do6QSl0Ih3LfLZAIGNkCd1LsQqn5fIGfPmIYT23bWW
	vOi6b6r+lQbCtcmOdH7r4KMqYNk/skh0fzEbF2huA/iaJi5SsbRh5GmX+HsHqETmRJaoN3pUUs6
	E+DcaI3Bd/A==
X-Received: by 2002:a05:6a00:4188:b0:848:2f84:72e with SMTP id
 d2e1a72fcca58-848898b9d90mr5651239b3a.65.1783879244916; Sun, 12 Jul 2026
 11:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com> <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
In-Reply-To: <ce54c773-22cf-43d2-b831-1ea5355359ca@kwiboo.se>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Sun, 12 Jul 2026 20:00:33 +0200
X-Gm-Features: AVVi8Cd8NGiWyQj59k9G_t9WcUTCbNW8tUsN3M5fDY7JrN-hw3Tixg2ATvZSB5M
Message-ID: <CAPSPb=vyKK3ngm+d+nN7KM20ZyA10Hg5cb8EarRF6SE4hLOWFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	diederik@cknow-tech.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_110045_696718_DC0D5EAF 
X-CRM114-Status: GOOD (  24.28  )
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

Hi Jonas,

On Sat, 11 Jul 2026 at 01:36, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> Hi Joachim,
>
> On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> > This patch series add support for the NanoPi M6. This board is very
> > similar to the NanoPi R6C and R6S boards which are already supported.
> >
> > Main differences:
> > * M.2 M-key slot with PCIe (Also present on R6C)
> > * M.2 E-key slot with PCIe and USB (from hub)
> > * 1 additional USB 2.0 port from an on-board USB hub
> > * RT5616 audio CODEC
> >
> > Patch 2 and 3 moves a bit code around. Please let me know if those two
> > should be squashed together.
> > Next few patches adds some missing bits the common nanopi dtsi file.
> > While the final patch adds support for NanoPi M6. Support for M6 has
> > been split into two files one dtsi and one dts file. This is to make
> > it easier to add support to the new M6V2 board at a later stage.
>
> In my personal opinion I think it would make more sense to sort
> patches in following order:
> - adding/fixing missing bits to the common nanopi-r6 dtsi
> - extract M6/R6 common parts from nanopi-r6 dtsi to nanopi dtsi,
>   nanopi-r6 dtsi includes the nanopi dtsi and no changes to dts files
> - final parts that adds the M6 board
>
> Should probably make it a little bit easier to cherry-pick and bisect.

If the additions/missing bits needs to backported I agree.
I'll cook up a patch set with the order you suggest. Thanks for the feedback.


best regards,
Joachim Eastwood


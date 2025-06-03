Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E54FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 16:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0THOM9Tz5cCxzIN1XwnlflZSYvRYNrRsuYDsh6RLVs=; b=aYlHb/+qrgk/KwZb3n/kJdfkwO
	DsKveFnpmb0Wtw8EAEE0+565cuAbHfI+6F7x5Ssic/h1/z3bZSK/qLyM3PboWFK1kQtaxP86GswZg
	c/BHOpkNNAF3JBrMvu+i0YtipHSSgeWQxcBAYsOS9ZNZJU/nxwX+kZS4MTsLnGEU7ob0yChTy+EUk
	NS44UAjkD0XdkoWwxSnDdU2kuez/zcF8V1Q5YAKTbRiQfUxzYzthxMAQScvQMb//So8MBlsVr7uDS
	ht+MInvQVogPtfLP7C1mYou/12VOI57n4td87p1yWfH67ZUVIwfN0ukqKQ9fx+X+yLWeaUN+sgVOA
	3OQwOxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMUAI-0000000BMvg-2xst;
	Tue, 03 Jun 2025 16:07:02 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU88-0000000BMnY-12gS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 16:04:49 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-70e2b601a6bso54150287b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 09:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748966687; x=1749571487; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r0THOM9Tz5cCxzIN1XwnlflZSYvRYNrRsuYDsh6RLVs=;
        b=ro32E7VaLSAylkgMo0TwpX9v8ZyTNJDq2xStsKUb6QJWCS+eN4aCbyBko4i/rZHiFr
         qLkXecfEadfu1c59YbstUazdOfIl38BV+RboPxRQLwC+po81GWM4PzAfpHfKvkm9dBw6
         BGHWujNi1442qIRJ/CVGCP5EQ93SwP1yYdqsHrJVVby7SL6TG3pF2AJrkfavbAIvMNiI
         Ax3GBUnTbzwlJznMnMCvjOleD0U0055Zz/P1RdIcbn6Nz2ToAAcUD4YfQ1Rm5PT1oU+q
         +q2gQLwX/Gy4qxrfxhJIeXk/GRYasvokJ0vFSgEpkXlptwIbDiCoku3GiTsVHQz0kQ8F
         GbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748966687; x=1749571487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0THOM9Tz5cCxzIN1XwnlflZSYvRYNrRsuYDsh6RLVs=;
        b=JnGH1IDa2l1bM0BqsjcmGSkid9bd/BZKogpe7a+uANt66ETdoFL6fDX5qp3Y8QERpG
         /G2xtjNJKbMly/4E38QNW9EJkHKAOTJt2cMmGJs+gDQIbz7AgtzryKSsf0Lz7c2f+HtE
         BPvejmfuQHhHuCLnHLjKwG87yHcTO54KdwNgCyHoV5TrGWKdac8Kt5Gq4XD4rtEks04Y
         kX1k/RuzQPoLpv3MyXGsBUZTyuZh5RjpZup/xRykmijqPdosgSWnUKPQIjcIdsNHEEN9
         L03EjgdDFGODFicOABYFA+Hdxoh0M4gwoyPzFoQnZ3vVzLhlsZGnjZU7eBXthFTZ7e3r
         ZYAg==
X-Forwarded-Encrypted: i=1; AJvYcCXkASfnmwFeULWbjT+k2kTEoXlWXXpwrWvJW9GYvLZ1qgP9dHDQdqsyeM8pFexOeJwcjp0NkkM8qC2MZk5hmess@lists.infradead.org
X-Gm-Message-State: AOJu0YwdW+mUAOWFgfpdta8Mwd8P7F++2sjloZMLG8w36eicx/ht+yTl
	LJ3wmOUAVZHjYH2K2pKHehD7OeYCElAUoNtZIbrCxdzn5nttHBTbsQwjdoeG28m4foPAnUpPpn9
	to+SXoKsZWAz8Rc1rsXmmyT+jW+wRkvkl5YwQHd64jw==
X-Gm-Gg: ASbGncvOK4yytrqc8o8dm2AgNAWw+cDM9chY6BFY7klyiciVM7qlkLckOkBHbUhMIh+
	SCUwqJebVyklG6J/7P7BbzryFh1f+ihwl00CkQC5EvM86ztv/cBuX7lJl6ewuQ2BdPDEdEWYcty
	wzNa3TUELWltV0L/ifqfoOOI8MS9KKCuWM5g==
X-Google-Smtp-Source: AGHT+IGGBjij3QIsy1jCA5j8zhjft+IKrsaACySUg+k62APod+FXdi6qj6xIeTrUNlmOm0U7JH6MVf56Z9FJvtNzNHY=
X-Received: by 2002:a05:690c:3705:b0:70f:83ef:de26 with SMTP id
 00721157ae682-70f97e7a4aemr301883097b3.11.1748966686958; Tue, 03 Jun 2025
 09:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <aD8adnQWcII5XO2J@lpieralisi>
In-Reply-To: <aD8adnQWcII5XO2J@lpieralisi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jun 2025 17:04:33 +0100
X-Gm-Features: AX0GCFs3bGWxJOOMb_L3bfbyIBUrkcS_9aOXC3iJXsU9QwpmVE1adonerRAeDig
Message-ID: <CAFEAcA9sdrykbVLntW35fo0MgV2VNXnLUFa4AM=Aw34bOBprYQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_090448_297839_3C69200A 
X-CRM114-Status: GOOD (  14.40  )
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

On Tue, 3 Jun 2025 at 16:53, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> Specifically, for IRS/ITS frames then - what the current schema does is
> correct, namely, it does _not_ spell out whether the IRS/ITS config
> frame is NS/S/Realm/Root interrupt domain, that's information that the
> client implicitly assumes.
>
> Are we OK with this approach ? This would leave open the possibility
> of having a DT per security-state.
>
> If in the DT schema I define eg reg -> "IRS NS config frame" by
> construction the binding can't be used for anything else.
>
> Please let me know if we are in agreement on this matter.

This would break the QEMU virt board -> EL3 guest firmware ->
EL1 Linux flow. We need a binding which lets us optionally
specify "oh by the way here is where the other non-NS frames are".
I don't have a strong view on the specific syntax.

-- PMM


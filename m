Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1EECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atvMwbJ0CD1Qgw9n/AbGYQP23fPSSpsGQ1kXN0eApLs=; b=KvSZn2w+q8039pKkeocUQQQQII
	ze8IrYrT+yk7HeaVfxwbEBlb2jgeA6gcyjOm83QqwCcAbQ35Ll3sMOvrQiMMO53sq9tDPmahixpPZ
	VhA0Bfg3NpLq/xaOLi2vkFClXPAvZXihLL7eYczFcrRPrKzIcUAhEPPVkwHkEMAmc4a6pPmmoUdsN
	OSjkpddfwBEg5wHcdtMvISxPWKm7BLs+G/rOk1JmOFDFUj9w9lA9z+OlHOBzc3mio2n5Asblasgik
	Z57t771tSgTaFZz1BBuNnWvnq7Iaza1doTKYAKk36q66ZzZqSAmp+pJTXqkkQi91Pk1vCwRWCkOcl
	tBnTccOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq2X-00000001o4C-1nVO;
	Tue, 26 May 2026 11:33:41 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRq2V-00000001o3P-0Cfb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:33:40 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-516d6009380so3101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 04:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779795217; cv=none;
        d=google.com; s=arc-20240605;
        b=C24T4r9uXzZVP+qibIT59q/LadXKHqP8fvGIUNauwBLtmOVwMSJhT2qnC2br3OWzN9
         mrGjiHuzAMdL1z9mG0LBriXWyJQTH+WdON1Q0HH5Xg/4Y8t/XWsyJ4UKXS2and+tqRyD
         u+t/SG3hWavexF9Bc7nVgPuYz3PdnHgOt0F0m36XxsCuAb5VBraLvT7dyDdQWUjieztP
         uigF4TU1z3mL9nxwW2yLPghChaN2g0itn6DJI5f6nIXJD5v2mbf1W4ps5D9s/9iKUvaK
         TA24uYuk9+SuN30NfzBB36JrT7O66FCrsAp2iLjCgh8CJ5bnHLe9vwwKFb54V3SLWkDY
         LWzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atvMwbJ0CD1Qgw9n/AbGYQP23fPSSpsGQ1kXN0eApLs=;
        fh=n3FrE8YjFmgjKLWaMFXCGTs/6Hj4lgw0rEOYcYtoKOY=;
        b=RRiYShuz6j2bpsPVq5eXbY+dp1CRf+YkBopOzDOh361G4YjrYpjsWTqwqYM0jxhB7+
         9DPbNlKvS5eaa7Tbn9LQHF315rubA1qG9rGkeUEfvOMyqAyOKsMJs7COrnR8+WShlVF8
         nZceWGEXUbjgQWXUW0EepuZzOYJR/dRuSE7fNyKGzQbTFXbPjqv3EZjE313wdt8uGf2K
         hZq3IA4Qs6S4YAm5SPwD3Z0lEzfDB2LB7IPyxeF0YU34mFIBnqRJhDMo8f3G9nwD9Ly7
         ZGZOTRMJ4oRVnFS1V+5AocKuHw4H+56VQGHZi0+tDk5fo7GNi0zJPs/eoS07RDveHu1a
         WjWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779795217; x=1780400017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atvMwbJ0CD1Qgw9n/AbGYQP23fPSSpsGQ1kXN0eApLs=;
        b=saCWlLvzJS9I/as0sAJnSEY21VfjYABPzAIbS4MogttuH3saZdrt3ip2kogTWCI3Gc
         4EN6fkGTH7vR3/wSnplop10j6Ome6dUxJOQV/py9z4TrOZ7mdV7dY/2sPsEzbZQZWWXm
         6TQESS34hbLG86BjZnvsr+rSqf7NXLlX06o95PWhDcUlVcU63F/13HrFMW6RHULUwX01
         LeDbMd82WrUJmiodRGj+7+F//1N6XfwLFQPklzczr+xBW5UvwbvCtfNcUCQcnbhbn/ZR
         fzLDcMdpxtH+0sHGbwL/XLSu+PbxndjR/DHGHnjTouV3hDusmJv9l35xSWqnxGX1f62W
         o6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795217; x=1780400017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=atvMwbJ0CD1Qgw9n/AbGYQP23fPSSpsGQ1kXN0eApLs=;
        b=UXve41KucAXAaMQoZFAAmtzLBgzk3rmIccxCRM1kebww17/Mz7IkEarwBryZ1W+22l
         UhJxebCVwXLMQSXKUOHH5XxFfTollYxZrPV95w2A7CaWXGRc3/FMBPZ1F+f1NK/28Sjz
         5gAZjF6iMat7YP5xfiLAwEYhBq6nD/a62F1Ky8TnR9PVIiGkSxAzXRkEz0947gg+yryR
         qxCruoRe2QgqFU1Klodx6G8kLHAvTCXJQjgIPwjYqzCxRrLOw26UOBT9jP4e+AukUSqY
         130uQdSUpocnInbWmIELY1TDSWCVA6gcrLqrOhSrECnC1x4yLBQ++HutEZ6+Ym8qNYzo
         BhvA==
X-Gm-Message-State: AOJu0Yyc4p5mMYgM7N1x9Dp9JC8anpYpVf3q/Jrk3+87iWJzagF2xG9Q
	0z7MAeFn6dx35BTL4tqc3qFANkEcJbC3hg4kx5uCi6ieNKtPdKdVtHc8Pe5Pe35RTL803uZHwYr
	9JeAkMa+XkmRSioWD/1mAmPUF3uKdlaJCIinLmoAg
X-Gm-Gg: Acq92OFA9XAcXc1gSYk2Aunt54EVvP2RQk2YCLgs6VcmHRTru2vs0nJn/DKaepvJvbn
	aQt2BDYttGSqIJXi3E8ihWfoJaP5j6E60NBJsRZZJDs+93jgYpF9dGyIO2ZyBECGiUNrmjjofuo
	75f3VD6r1rrFpfCuMDg63IM5XfmT9irbr9CCf/9OTYFEx/GD6dw2meAmiSYhpB0reAMQ/8PnHHv
	m8QcsjlT8YHjfAJTMxd2845a1ht/sMuv/vHZBBQkrWzZxJ98G8txpdPtDekpmutI9rN3IbcIIMk
	vGvvZZtL1jHpbi9WCg==
X-Received: by 2002:a05:622a:4e9b:b0:516:9871:9a37 with SMTP id
 d75a77b69052e-516e1e05b23mr26728301cf.3.1779795216931; Tue, 26 May 2026
 04:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260521130503.4103369-1-smostafa@google.com> <86zf1qv4do.wl-maz@kernel.org>
 <ahVQtakwshwI9ss-@google.com> <86wlwqv711.wl-maz@kernel.org>
In-Reply-To: <86wlwqv711.wl-maz@kernel.org>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 26 May 2026 12:33:24 +0100
X-Gm-Features: AVHnY4LmefrxBo2Dlj6tX0a9ZTMlm6FL08FrsJSABBI8jrqea82k9GI6lV0L0no
Message-ID: <CAFgf54rDrKfKMREWhQPKMvWsN75J1Ut-ZBci2nJ00MwBOR6pcg@mail.gmail.com>
Subject: Re: [PATCH] irqchip/gic-v4: Harden against bogus command line
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_043339_104939_F31E70A0 
X-CRM114-Status: GOOD (  10.62  )
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

On Tue, May 26, 2026 at 10:45=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
>
>
> You should still be able to have a virtual ITS, just no direct
> injection of any sort.
>

True, my bad.

> If you're happy with that, please respin a patch with this hack.
>

Done!

Thanks,
Mostafa

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B40FCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 02:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=; b=Gy7Ee/MCRiOUAk1zMOc/VdJ3JF
	fyR3aentXx38lLx6Rbo7+tpRuvvIksF33Qs6DXQMj9YQaWn/jYiM4yW5eroviMtnSTBk7kVw3RPaW
	K4RJgK9/kfathTWhdDAeDiC2fXPWWc+MMttCbfLYqZ0Z+7Vwi0AiF8tdc2eHMiR+wTrClB0l3/oLP
	FeUTaRcMJs2yuB15+zUkBa4ECAHqF6+VYPJoSlgZfLWN89K0ntlH0OgC2wlTEy2PcGR1AF7zbZbIA
	CBYsdIsRnxOJV2ezmsSb4vbIUv1eKlZt8iLv5OtigRwsgQc6SEQadklQlwAvoSWukuV+YnAbDVQoN
	4YDZJpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznIg-00000008bGm-30hL;
	Tue, 10 Mar 2026 02:58:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznId-00000008bGC-3Yni
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 02:58:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ab232cc803so57154305ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 19:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773111502; x=1773716302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=;
        b=Qk+0Be0G7r9y7Kz2ahmkS09y8zp4xGpK3wUljSJsP2dW9rHznlLlaIBhcU4XWJ6EwQ
         fmx6kMs3pTK2ARNR17HDQBUciMF9gHLUgyhKXmymjNbteEWF1J9gUE4i0x3mUyrteP9X
         YoGC9+egK7VJI7ilPv3xThRBBMOyzNgTodv+IgxgfBZ5PufZk/yvFqIffO88+za36hpl
         KkvmFkU4OhMI8DBjc1XzJRG4y0Z11JWmkmNrLjSkmx9npkVYArNZmwGOa5CD9LXr0Q30
         rEl7+7/41LX3oonTXJXYUBYXCUskkEUptCwynKpqV0WqWxhOGolKuycHFsFywPU21aPo
         e1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111502; x=1773716302;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=;
        b=NCxbbRNDlvoGNt6FC3WyXq/OPab+/Q+Tt5UXgIveM5rReoKPDY6LmUCDS008gnV7Rl
         Js7Ld30Ad19RR0rZQTqjdG6kZA2IsW3/B8A809ZePRGXcnfW5oF2eSfe3qAUqQx/7/Gp
         OmAtCEhuP88gZ2lErHolddXOOx+vjJK35x3cF5NNvt3seoLDVOyh+GVIIcKs60FxcJ+r
         ruWHrSP2PZDi4GIoyIUP8BNOnoRUxKOfqCafKfjU8z6hNcIlSAn/WAJQDXY5r4ox/qjq
         sCXkbnKy1/7bSgtiLOaA551vF5rhyNF0OijtJFGs8OoRYgYho+4JQnVfH0H6cpQY6hNw
         XvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXh97XbPwb07freQta0Dk0gT5lc7g4OhA9Vu5wfnxWm8jyZeZfH9pCu614+GLajxJZ97yx6+684uV/rRL+CI2D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi5rtC73jmZUiixeZgyf1jnHllmjXVbaTZcniUhbxDh/qXxC8y
	AinNSenmpW3+H4PKRMoPOzq2hDxLHbqB7mVnJYag0K/smPmA7MFM9uxe
X-Gm-Gg: ATEYQzzCFHzcnez0wvlrCUgUirLWpmeWcoDDs/xwL0lqtjxHPKoqQXUwUf/VIWtuBvv
	M7wl9ja0T8P9s2wkDweWR93RZU4uKXm5Bg6TnV3Xbr1A4QAHKr5uYlMDIKmmMykpO8IwKdyiwDi
	8V5+aCpwwxG1M+ZgbsgYAAGch71OHRBoaEb/Gs0lKW+0k99q+byUTwh9bkxOOOFu89RJ13Jy5mo
	rPfDzCbK3cMKnUcFE2KejO0SWTj73UN98YD6JYny/WvaLiFrbKubsyZ6VQMONovWAmCJxZGumSe
	I8BcWHw2N2YchrsifpwPisxmkJ6HSg6YauhNTvpYOsXK8sOlVU0R7BWBsA4R4H9ETYBU9WqMOqc
	mylFeIJe141E0nWZuYJ39oZ7LrdqxobhAUtOaMUZnY0HliZnfJpo1FKe/YZ3Gxt9HPnqjvTKTTJ
	LkpHdo/iUWasHMPo4L4aegSK/m9NaQvb7ugg==
X-Received: by 2002:a17:903:1a24:b0:2ae:4ef4:1415 with SMTP id d9443c01a7336-2ae8238544emr125594555ad.13.1773111502419;
        Mon, 09 Mar 2026 19:58:22 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:53d0:5b96::e3a:5d35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f75b15sm178533205ad.52.2026.03.09.19.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:58:22 -0700 (PDT)
Date: Tue, 10 Mar 2026 08:28:17 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Marc Kleine-Budde <mkl@blackshift.org>
CC: mirela.rabulea@nxp.com, mchehab@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 skhan@linuxfoundation.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_media=3A_imx-jpeg=3A_con?=
 =?US-ASCII?Q?vert_kzalloc=5Fobj=28=29_to_devm=5Fkzalloc=28=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
References: <20260308060554.1764128-1-sanjayembedded@gmail.com> <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
Message-ID: <6E937F17-2248-4E9C-B2C9-A28FED599703@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195823_888620_C9DA18D7 
X-CRM114-Status: GOOD (  10.31  )
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



On 9 March 2026 9:23:57=E2=80=AFpm IST, Marc Kleine-Budde <mkl@blackshift=
=2Eorg> wrote:
>On 08=2E03=2E2026 11:35:54, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>
>> The driver allcoates memory using kzalloc_obj() and frees it in the rel=
ase
>> path=2E since the allocated memory is tied to the lifetime of the devic=
e,
>> devm_kzalloc() can be used instead=2E
>
>What happens if you issue multiple open()/close() cycles per device
>lifetime? Will the memory pile up, until the mxc_jpeg_remove() function
>is called?

You are correct=2E

Since the context structure is allocated in =2Eopen() and released in
=2Erelease(), its lifetime is tied to the file handle rather than the
device=2E

Using devm_kzalloc() would defer freeing the memory until device
removal, which could cause memory accumulation across multiple
open()/close() cycles=2E

I'll drop this change=2E

>
>> Using device-managed allocation simplifies the error handling paths and
>> remove the need for manual cleanup=2E
>>
>> No functional change intended=2E
>
>Marc
>


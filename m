Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510DDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3bcQYkQZt/TrC3+4/QDswAa5KSqpmEtZ/5nFygMrjc=; b=e4+2iUTIsGAwHpwq+fac7zlV7k
	Z65LMgl/v6fQsApEOxOHP/kNeG3Ocj589u0OTM9svsqZQuuk2pEJLCNL5Lf4Wmx+uFcsGK3RpQ9Dr
	/jMG5IBR/4JBGFWavCb3GlG3W02SDJ0Mr38EV7/j/to1nUT417UgRD17MZNkYJgHAxP/ousck8nPx
	5ItQrc2AZ+eciKuwh9ORzhYh6QKBgQxCv9HhawgkG0vAu+wO7NJE8s3vYkKiL75bUnAU7gqGOGg9O
	GvXqMVRwxkxsfgS9qYKiBjyZdHrt4qJQYcyP5szq9n1pFgQ+340QJ2IIxwedDpJ3hY1br5TSMdlHO
	n3e+s6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTRV-000000057V7-2WcP;
	Sun, 19 Jul 2026 15:28:37 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTRS-000000057Uj-2EeK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1784474913;
 bh=z3bcQYkQZt/TrC3+4/QDswAa5KSqpmEtZ/5nFygMrjc=;
 b=StNZZRslMeRm2EqMsoglNLREKqtqAjSDScJZRtHnjVJKei0zpsQyj4RpvUQr6r03sGaD0ehse
 HUgisVEGOvyinYrNvebZSYq9e5hMevSxB5mk+hFq7yMqXoLTV4vKnSLjbmdReZ55tEgufnkkx3P
 b0ahSA702wrvHb9U9Cuopa1IiXXGWWaiKH9lDuLzumKZch2EAfaHjbpG2ofrYtTQeR+Zt2HTFPr
 RRxPfv6+f/yR1lSQIJ2YoUZpjI32uTbbMnosVEbLuELtD/eG9ctcANfJVkvD9ePhlHcdPyAWtd5
 R3IYcU6k9AnXYr+XWUsu3pBF7njdd5whFX3VduZLjlrQ==
X-Forward-Email-ID: 6a5ced1adf3bed975f54cda3
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.11.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 19 Jul 2026 11:28:25 -0400
Message-Id: <DK2NK6ERU0Z6.3FEOZDJN7UP74@ubuntu.com>
Cc: <asahi@lists.linux.dev>, "Janne Grunau" <j@jannau.net>, "Lee Jones"
 <lee@kernel.org>, "Neal Gompa" <neal@gompa.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Joshua Peisach" <jpeisach@ubuntu.com>
X-Mailer: aerc 0.21.0
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
 <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
 <07d37cf5-d49d-4507-82c8-7c6d8c9e01af@kernel.org>
In-Reply-To: <07d37cf5-d49d-4507-82c8-7c6d8c9e01af@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_082834_713265_8ED1298A 
X-CRM114-Status: GOOD (  13.24  )
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

On Sun Jul 19, 2026 at 11:15 AM EDT, Sven Peter wrote:
>
>
> On 7/19/26 17:02, Joshua Peisach wrote:
>> On Sun Jul 19, 2026 at 9:00 AM EDT, Sven Peter wrote:
>>> SMC firmware returns the value of the #KEY key in big-endian unlike mos=
t
>>> other keys. Reading it through apple_smc_read_u32() into a plain u32
>>> and then converting with be32_to_cpu() makes sparse complain:
>>>
>>> =C2=A0 drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
>>>
>>> Read the raw value into a __be32 using apple_smc_read() instead.
>>>
>>> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management=20
>>> Controller")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes:=20
>>> https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.c=
om/
>>> Signed-off-by: Sven Peter <sven@kernel.org>
>>> ---
>>> =C2=A0drivers/mfd/macsmc.c | 8 +++++---
>>> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
>>> index 358feec2d088..514cba7dc897 100644
>>> --- a/drivers/mfd/macsmc.c
>>> +++ b/drivers/mfd/macsmc.c
>>> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device=
=20
>>> *pdev)
>>> =C2=A0{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D &pdev->dev;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct apple_smc *smc;
>>> -=C2=A0=C2=A0=C2=A0 u32 count;
>>> +=C2=A0=C2=A0=C2=A0 __be32 count;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 smc =3D devm_kzalloc(dev, sizeof(*smc), GFP_KE=
RNEL);
>>> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct=20
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 dev_set_drvdata(&pdev->dev, smc);
>>> =C2=A0=C2=A0=C2=A0=C2=A0 BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handle=
rs);
>>>
>>> -=C2=A0=C2=A0=C2=A0 ret =3D apple_smc_read_u32(smc, SMC_KEY(#KEY), &cou=
nt);
>>> -=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0 ret =3D apple_smc_read(smc, SMC_KEY(#KEY), &count, =
sizeof(count));
>>> +=C2=A0=C2=A0=C2=A0 if (ret >=3D 0 && ret !=3D sizeof(count))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(s=
mc->dev, ret, "Failed to get key count");
>>> =C2=A0=C2=A0=C2=A0=C2=A0 smc->key_count =3D be32_to_cpu(count);
>>
>> This makes sense, it just feels weird reading because u32 is.. not a
>> be32 (that gets passed into be32_to_cpu).
>
> count is __be32 now (the SMC firmware returns that value as big-endian=20
> because Apple likes to think different) and we read that using=20
> apple_smc_read now which just reads raw bytes. be32_to_cpu then converts=
=20
> that to a u32, i.e. the type of smc->key_count. There's no functional=20
> change here. What's weird about that?
>
>
> Sven

Pfft, brain fart. I thought you were going other way around.

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>


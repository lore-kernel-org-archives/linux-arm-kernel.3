Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6961E7C6E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 02:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX+STYIHVNsNRwCOU5eoDnw7m2xr9Ak+mtAzKnocjoo=; b=uxbZmxaDSIOjcsdRXLL+2ROzhQ
	WP9WDzuyyHJlsAxq4zIdUd6GA+4xA6BD2mCE13NHfnOYLp5973ogkJsyne4YK+8a43kWQDzMsVw97
	kdx/2L6WJFWsRFCSAJVrvpU7F52/qL36F7Hmomg4GQ+0eJh8A79HZctJUR1KPKb3aZ8M/QKyeGAFD
	BiVAMWG5KHzkVbt05Kg2uH1oYBgqlZqTNPJegCB6H3y5rpfRnjzMRPT2bT7Ud/YeMvw9D+d8c2OAl
	pdnje95l+QmukLapB7bJwh57zcDRlAK99J2ZN9zHD2JxkjyJHBzEIpMdByjLhlbT1qBbtSQSeg+Gu
	wCaCBW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmMza-00000003B3t-3zBI;
	Sun, 01 Feb 2026 02:15:14 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmMzX-00000003B3T-3GPN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 02:15:13 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2a0d67f1877so21727485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 18:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769912110; x=1770516910; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX+STYIHVNsNRwCOU5eoDnw7m2xr9Ak+mtAzKnocjoo=;
        b=hzvqY1RaJ8syn3MuYX6Z8uOakNzkCJraq4UWKSyI6US6SOObukdbKBXmatBlKGSYkI
         E9GB3vduPokJsGpMNm19XWXRo5DtY6SevrPKPYgCchi/K9WvRMsHhdr5sA9ZsmsxR2qv
         DEXwFuSVBA+WKUi0ex8rtdGsVEw51ViofAq4gSgnGaZcxery7rvSXPyZNRNgzRJZx1ZX
         SDi3UJjvGBAu/FMSEXOJDVgsxm2mzYZQLW+017R1ifW0ZNhrFufE+0o7HBoGnOU/+Q3U
         OM6qIGBH0e5ofKAT3DaWLwS5QzLsFbLelFNIg8OCxSL3NDH8hT52+YCdcXdWeOv15CZu
         A6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769912110; x=1770516910;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sX+STYIHVNsNRwCOU5eoDnw7m2xr9Ak+mtAzKnocjoo=;
        b=gHvIQtg3K1X43FNaB7heKlOYtx5EC2C2OBTRjOFVFo9tpEVuH8jZfSS5gvCGaGdfhs
         9bTWpQOpGLf0ksHCdygSkRCRXrPgtgIb8/ezWRZxwO2l5fTDWw05CEfROhlsJ7BkfHIl
         d2OT/q2mC+AT+zLIRo7zZ5i+j6p4HENwuS9Rba8ucmoXZwKePPGICRFF9As04mjZ647J
         1GQdd62BjxG0ZxQoivCZcNqH5cv2nmWVVlIYlntGUKRKT1+WbB82Am/nlZfGLmh8joJc
         feSQF6I4KrxsuCB6+eBu9wDdtW8ljOzKHIpWJ3T13SM2pnCdyqOTzlqATtMHwx8vefR7
         Zdhw==
X-Forwarded-Encrypted: i=1; AJvYcCU8anFKDNKU6+3NAxt75imEvjI0PEctozWEpOZNaQEx/3CFU+H5wuBm7FjcUN1HKCQFWA//8FjXitS2oKKVQBGn@lists.infradead.org
X-Gm-Message-State: AOJu0YxITN4wJgekamUkBDmcKgM6ksie30BT9GUUcyNjQZuIQN0IC5ZO
	YGAsq30mCTlVIP3FEE3Vafi4CBrSnYcNLLIr403V9mlgPU8eiaS5M/1sIfGP/FU/rbs=
X-Gm-Gg: AZuq6aIOmeQgRnyYITzp5ni5L4bueZZUGJIlbQWboZQXt3uk44YQQ9c0HviJ8fpKH+B
	Bz/YuMVaqXpkDUkUwd4k/LXVk3ik2lvGCXmwb2QhdxRUzFUzZLExouggykBUB5p0zkyd3rblgwa
	6PV45qptYP0HHTiTynTX5R5W3eSUjjvFo1zVqw0GRFpMEMXrajsKjazUm+xr3LvDJTnlV7Xcd2L
	6+iPGHyMRUSbH5j/ooBf4PDwbvnbFwwRSzrYHgwbpUo01mxM7sUDfLAQyfRleol20dY27FnNIjX
	YfIw9OOWscZL7mCLbFp8iIELu1SYKWaYWklLSpv63WO6zIVx2DwfEvWv7Po3O4LDIDOZ1vLMTiG
	UgETSxRjAdLgTwOmxcMeIMpZc0F0ofRp/NNojJTr8elCOb+o4WhnLd4k5SoNqUw0sldERjHNwDZ
	4fS7LC6dQmtgOnH1xd81Acu405hvJD2EHfirACpe7AU4IcbMjAnvna4dL23NAG5xdmxPjaps0=
X-Received: by 2002:a17:902:ebc1:b0:2a7:7872:8f52 with SMTP id d9443c01a7336-2a8d7ee6a5dmr71880265ad.26.1769912110101;
        Sat, 31 Jan 2026 18:15:10 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8ea985c48sm39915685ad.22.2026.01.31.18.15.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Jan 2026 18:15:09 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <202601311615.10yziOui-lkp@intel.com>
Date: Sat, 31 Jan 2026 18:14:58 -0800
Cc: oe-kbuild@lists.linux.dev,
 Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 lkp@intel.com,
 oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
References: <202601311615.10yziOui-lkp@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_181512_080297_43277983 
X-CRM114-Status: GOOD (  13.99  )
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



> On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter =
<dan.carpenter@linaro.org> wrote:
>=20
> Hi Abdurrahman,
>=20
> kernel test robot noticed the following build warnings:
>=20
> url:    =
https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain-via-B4-=
Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/20260130-054653
> base:   63804fed149a6750ffd28610c5c1c98cce6bd377
> patch link:    =
https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e434897ef%40nexthop.ai=

> patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
> config: i386-randconfig-141-20260130 =
(https://download.01.org/0day-ci/archive/20260131/202601311615.10yziOui-lk=
p@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project =
87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch version: v0.5.0-8994-gd50c5a4c
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: =
https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.com/
>=20
> smatch warnings:
> drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: =
pm_runtime_get_sync() also returns 1 on success
>=20
> vim +1539 drivers/i2c/busses/i2c-xiic.c
>=20
> e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void =
xiic_i2c_remove(struct platform_device *pdev)
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device =
*dev =3D &pdev->dev;
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct =
xiic_i2c *i2c =3D platform_get_drvdata(pdev);
> 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534 =20
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove =
adapter & data */
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   =
i2c_del_adapter(&i2c->adap);
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537 =20
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D =
pm_runtime_get_sync(dev);
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, =
"Failed to activate device for removal (%pe)\n",
> 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   =
ERR_PTR(ret));
>=20
>=20
> pm_runtime_get_sync() can return 1 on success.  Perhaps use
> pm_runtime_resume_and_get()?
>=20
> 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   =
xiic_deinit(i2c);
> 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544 =20
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   =
pm_runtime_put_sync(dev);
> 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   =
pm_runtime_dont_use_autosuspend(dev);
> e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20

This maybe a false positive.

The following commit switched from pm_runtime_resume_and_get() to
pm_runtime_get_sync():

commit 810199f7315604b i2c: xiic: Make sure to disable clock on =
.remove()

Uwe, Michal, can you guys comment on this?

Regards,
Abdurrahman=


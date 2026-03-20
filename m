Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149211093177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 06:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1iz6MeksNNtIcxd9ic1iSI1CofBBNW6rOw3XqGitRw=; b=XhG28q4sDJkjoVzeXB6SK2/nSz
	myEVC6zKZU+WSmnW8bOBnEeVR9wIB7CVm1yEvsQNIwD/ufH48JeYQz87lb4ef7hq4HhLuborlwZ3N
	U0g1BhpTad6mFY+caVwnOX0qNG5UMALc42zFm2TnfLW5DB+thwOPkPW9cb5r5GPY1UPE7LyIvgn0D
	EnrxG1KW7TXBx5/F95vl6b0OCzxZ4oDkX2O8LLyDpeP4J6rOhQ0Na8wTVwtl/ZzTLsKEygbDuowJf
	wTvI6CNVYQbsdDRFZ765BR/1xxgiaro9BS7m+f6xx9vm49Abu1rUZWSm9tHf0rjI8Tos1eQYSYtEY
	/fltv/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T62-0000000C9Tu-0bOz;
	Fri, 20 Mar 2026 06:12:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3T5z-0000000C9TY-4A2c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 06:12:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c736261ee8dso598401a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 23:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1773987150; x=1774591950; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1iz6MeksNNtIcxd9ic1iSI1CofBBNW6rOw3XqGitRw=;
        b=Q7JNn/lof3oAp5rBFlp7PQ+6EhQ5vAFHm5DVOOxqOyImX2B7R1dQfJ1c3g7mzybR/L
         ucmfN82HuopTjhL6bPkNkPdEiT9094H6C4r3+/7wpNGtA/mQhF0yH8LrjOlX0nPzWm8A
         waz8rkeW1za6dhT8o6aMbNzTtD0lML8/erbg6HriHJOl2Jj6JikMY7yVYI8X+t98AKT5
         eWLNg4TQgGs35h02cOwdBDnbztMbou/3D5IuisQ3mYYkIeVbvF1HhOhV4GXqe76grAtR
         fNDhqBlYuPlCiYnXnwuWlCg0ZLNjDMeY3nSUXCkpfD4NYfTFX2m1HJ4Ko8VOQmS2Y0zy
         eWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773987150; x=1774591950;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1iz6MeksNNtIcxd9ic1iSI1CofBBNW6rOw3XqGitRw=;
        b=epN9lO3g/glhRU0EtKGDR9agVOzGiikNed5BvsVuGMJJSxWrI+zXwTcpbGWTZo7Len
         feLO2zwvKomVOshTfQaOHyGSfjpwsYnFdAYhWoOIZnLh4gpijEIQLRAx9DvAAQ+x8/GI
         OXp9ekTRHoV3Igl9fBjk0YnRTXzeEOvjTwXtaPX3cssWYw//TtpQvPItI5pSLGpbFOp9
         d56rmUKsfDc1OozrG1Ya4jiIcsfgAlzT43L3b/sYIdocvaBFrDYn90/XMZRjkpfBBvrA
         tUbLyJaElCLHWrfK0IKrHRqQzkyAZ9YqJQly4r+7hOjjNPbyt/71WhP14KoFFkdB3Nzv
         tz9A==
X-Forwarded-Encrypted: i=1; AJvYcCUtELgEmhz7mGBVWXlkKxoIL316XHHExM08+WwaBfGeKXP15in3PiF4xgr2ScnUhHc5/YMhrCzNtd8pUkZINkdD@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2JMnKT/RNlOzy078rzKBHSfawhqqNH8tBChECJTi9bxiTfOB
	HxLFWqFDHZbcd5BgRxHOz3KyCpcHbpIEwBB6sVSS3NcQZDTx2F3oit4M8XOvxcmc/Wg=
X-Gm-Gg: ATEYQzyS2JyEizY1pVFlrzT6oPUctY+NMuppsoE6odhsYpe3Ema0RkMnaAzOBzGIadA
	PgmP299ADjNYEzWVud32iWjQZdkKJL1lIKLaio6UR0oFSDQIGn0be/5f4gOe/oyJBkdQojw/vl8
	RbsVN58tKIyU+wzTj3PGdHDZbCSUQbFN9XSyGErextKdv/xee9xFrj68d+mev4lmq3gMqjeZhzq
	EVoCUBlog5jhCddyKqBNOFUAXng7FqXpEOT5Slg8syQZ3qgm2CNWcO6aCv2lmJucmbSxdy0bbg8
	cnHM8nTh6sxnZAkOltj/9petl57ylqd4WZX9Sp+rCRIsfkDkjERNFqhxYQE9UWVMe9+Hb3RZMel
	cd6iBkuGGcY8ys/KRH6oksgPFo+ykg0/7SqdLcWdi71cFUExwPG2sZkFMJnLsEceKcPvabQVHCu
	UcO0WDj5MOXY7f1h71HmoB73zQfIXE3Q3aBbGRchEbc0ueCrw=
X-Received: by 2002:a05:6a20:7f9f:b0:398:b178:a53f with SMTP id adf61e73a8af0-39bceb427b1mr1734963637.40.1773987150278;
        Thu, 19 Mar 2026 23:12:30 -0700 (PDT)
Received: from smtpclient.apple ([50.47.115.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm968942b3a.31.2026.03.19.23.12.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Mar 2026 23:12:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.21\))
Subject: Re: [PATCH v12 0/7] i2c: xiic: use generic device property accessors
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
Date: Thu, 19 Mar 2026 23:12:19 -0700
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FC244FF4-29CA-4A3A-8E58-C6CDB05A248D@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: abdurrahman@nexthop.ai
X-Mailer: Apple Mail (2.3864.400.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_231232_066112_5ED684FF 
X-CRM114-Status: GOOD (  26.77  )
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

Hi Andi,

I'm just following up on this patch series (v12) aimed at updating the =
xiic
driver to use generic device property accessors.

I addressed the feedback from Krzysztof and Andy in this version. Do you
have any updates or further comments on this series? I am happy to make
any necessary changes.

Thank you,
Abdurrahman

Link to patchwork: =
https://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D493003

> On Feb 23, 2026, at 7:59=E2=80=AFAM, Abdurrahman Hussain via B4 Relay =
<devnull+abdurrahman.nexthop.ai@kernel.org> wrote:
>=20
> - Switch to generic device property accessors.
> - Switch to managed devm_ functions to simplify error handling.
> - General cleanups.
> - Skip clock setup on non-OF systems where clock is not specified via
> firmware.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
> Changes in v12:
> - Reworded the patch 3 description as suggested by Krzysztof.
> - Added fwnode to patch 3 as suggested by Andy.
> - Used fwnode added in patch 3 in patch 7 as suggested by Andy.
> - Link to v11: =
https://lore.kernel.org/r/20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai
>=20
> Changes in v11:
> - Cosmetic change to return 0 in patch 1.
> - Remove pm_runtime_dont_use_autosuspend() in patch 1.
> - Link to v10: =
https://lore.kernel.org/r/20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai
>=20
> Changes in v10:
> - Moved dev_dbg() change from patch 4 to patch 5.
> - Reworded description in patch 6.
> - Addressed Andy's comment in patch 7 (&pdev->dev -> dev).
> - Link to v9: =
https://lore.kernel.org/r/20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai
>=20
> Changes in v9:
> - Fix an issue found by the test robot in the cleanup patch.
> - Reworded the clock change description.
> - Add a patch to switch to i2c_add_numbered_adapter().
> - Link to v8: =
https://lore.kernel.org/r/20260201-i2c-xiic-v8-0-deb2dd158d1a@nexthop.ai
>=20
> Changes in v8:
> - Made the clock change the last patch in the series.
> - Reworded the clock change description.
> - Changed dev->fwnode to dev_fwnode(dev).
> - Link to v7: =
https://lore.kernel.org/r/20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai
>=20
> Changes in v7:
> - Drop the dt-bindings patch.
> - Skip clock setup on non-OF systems.
> - Minor commit body rewording.
> - Applied code-review trailers with `b4 trailers -u`
> - Link to v6: =
https://lore.kernel.org/r/20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai
>=20
> Changes in v6:
> - Cosmetic changes to address the comments.
> - Added a patch to use resource format specifier in debug log.
> - Link to v5: =
https://lore.kernel.org/r/20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai
>=20
> Changes in v5:
> - Reorder the cosmetic patch to be the last in the series.
> - Added a documentation patch to describe the optional clock.
> - Minor commit body rewording.
> - Link to v4: =
https://lore.kernel.org/r/20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai
>=20
> Changes in v4:
> - Reorder the cosmetic patch to be the first in the series.
> - Amend the mutex_init patch to also switch to the managed pm_runtime_
>  variant.
> - Link to v3: =
https://lore.kernel.org/r/20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai
>=20
> Changes in v3:
> - Reorder the "optional clock" patch to be the first in the series.=20
> - Add a patch to switch to devm_mutex_init().
> - Remove dup message in error path.
> - Cosmetic: use temporary dev variable.
> - Link to v2: =
https://lore.kernel.org/r/20260122-i2c-xiic-v2-0-134f5d743e8b@nexthop.ai
>=20
> Changes in v2:
> - Split the patch into two independent changes.
> - Added struct device *dev at the top of probe() and remove() to =
re-use.
> - Switched to device_set_node(...)
>=20
> ---
> Abdurrahman Hussain (7):
>      i2c: xiic: switch to devres managed APIs
>      i2c: xiic: remove duplicate error message
>      i2c: xiic: switch to generic device property accessors
>      i2c: xiic: cosmetic cleanup
>      i2c: xiic: cosmetic: use resource format specifier in debug log
>      i2c: xiic: use numbered adapter registration
>      i2c: xiic: skip input clock setup on non-OF systems
>=20
> drivers/i2c/busses/i2c-xiic.c | 97 =
+++++++++++++++++++------------------------
> 1 file changed, 42 insertions(+), 55 deletions(-)
> ---
> base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
> change-id: 20260122-i2c-xiic-3ba89ff5ea93
>=20
> Best regards,
> --=20
> Abdurrahman Hussain <abdurrahman@nexthop.ai>
>=20
>=20



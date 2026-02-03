Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19746E87855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Rfw0XG2ThbAXfeMl6ZSUUMc+ZydcYLefy3zvZERR6M=; b=XGXp8A3dZRD5JAgoly7bbAjLpF
	G/KMHuSA2RGr9zwHZCuWpfGr0AW+hexJ5mczmFxRh5SLVSJRvd9s8KPjLwzxv9q6eP6WwlGasqwdl
	MFENrc7412eKMO5KpoG9rAerA5uNvFbMYjM0OguP6hel6+nrjDhwuyIadMAXZJuSgz6SR8mkri7Ed
	evlGK0ZCWvYLIjMwInBiVTyxa+GCzuZS3lgUKZ4XGGZiSf8HhzkaYFeEioshRjVCRjylH+VwES8Dn
	yHpF59CkTwzxKmXHrMc10L6nKoj/Y+H5vqIM+Ow40LYPh4MSBzRA5nvediBmnbWF8cqWFGh3hHGLN
	iJyyA1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLUL-00000007CHh-0Q9X;
	Tue, 03 Feb 2026 18:51:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLUI-00000007CH8-0XPa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:50:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a90055b9e9so15255145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770144657; x=1770749457; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Rfw0XG2ThbAXfeMl6ZSUUMc+ZydcYLefy3zvZERR6M=;
        b=kRXiSDXwdNtw5oH1n+G8tu91nR/0knusKxtGi+rieLrUZAuF2F1cUpZkGHysICwnbG
         LwRcnADS+TRqwkjMrJnnjskxvDSQbLv2Iv8LAMvE475crcFZ50w5bG137lICQoCxyZor
         /Ca0WZqJm9SGwLhMJWg9GZL7n20iyZ4Oqi+m5+bJVvnCfiDXBM4Ccl80X/SetXUvQWkj
         w2NdrX/9asaWaytazOrCt0qzmO4ahsWWoaWqOfvp0TSrON6xIwp1wkfm7bOWE1a+IrMJ
         2Hq1KXLtHkafcZ5z68pCgp100NNXROkLXHU6xrAfeSKA1Tijw6qLh61ffNSdOklNmxAq
         pJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770144657; x=1770749457;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Rfw0XG2ThbAXfeMl6ZSUUMc+ZydcYLefy3zvZERR6M=;
        b=F66TiUGVO0qMLMcvwE5XV0P6vIvXeW7N7zASb12Yhyfy4SNkYMF7gos9/mDl3P09Oz
         o3rBo+BPHeXiy/cAmGVQalfzn0XA9EV1/oS+1B0VjHVfyFaMjIGdGWY64jiy/U4QxXLK
         HSOEm+JtLqNr8swWzmzMeQ53Y1n6gT7ZuQrbY0uYzMQJ1LNDG7dMaSDJsLK8BO+NFnk6
         Mve6CnzrxjhuE+cFNgYIGJ2txtn+LDfBE5i5/wt8fhzQwBhnBBbxcqTzSq22RLs71MH9
         syS6Nz1w/ibnvUsQ7dyL+0DevfVod17ql1wh5+u7oi0ilMp+tDEe/fwB+QJak7eT8vHv
         lYGA==
X-Forwarded-Encrypted: i=1; AJvYcCX14WDzZQv7cOk+Enzb0ACERHXa8ygz1Cj2oy4zmTa/OU0Wrc+xKuUcbHPSYyNYQXxExpwCkQ+vxcQ5gY0ykw1B@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi0xYstiH+L8bIFxVH9OJzmaAco5jmu5Nn3uXk+gKzGNi8sx1Y
	ySbX0OLDLX1FDTAHTa95LxkJJL7UaQHGVnT0rBYfKHdHywA+kAJoOaSQjWg/fgSKvSI=
X-Gm-Gg: AZuq6aJAHW6Q4LodF+v8m4soPpnK4R9tAPdC0e1bG2BD8pQ4cRHC7JlDEd6gRiPthgz
	x9R80hR7Ttonn7z7Af6KZeraQnMc/BoCtY1zI0hXxBNoDioGsu2lZAifAOLwCMCZqqfs/TOhShx
	QlzNdoO9PWouskq9B/wTZu5uOdSmbcsZxH88w7yXxKpiGj+G3hyl9pkDGu82vyNKwJmXnZkt6rA
	yKPUYDuVkG7UDARPcN3cFK6gc2Nm4KLP673MgcxVjgBH1Iz3nvVsUJXNoas2v0DPFDMudS9ODlR
	3WMZSd7GoDCVeXDqkyKiZ+CvbQ0bd8u6/rfWDjKXuk7no4jHXcNGLYDk8LTVaPA8KK3BJpQmHij
	y+1pIXpr2ndTpMjs0LrOsBfXVyI0Wc7LN1/XZCROlf8JRl7OcBx/KFDlSc8T3bLzt7Q6/Bd9I7e
	8Kj6YBn9/Tds16/9tmXymEN9CfF4zDrp4iCVQPxlMVCctutQ==
X-Received: by 2002:a17:903:19cf:b0:2a7:aa14:82f7 with SMTP id d9443c01a7336-2a933b9d152mr3156645ad.10.1770144657038;
        Tue, 03 Feb 2026 10:50:57 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933888e8csm2181465ad.29.2026.02.03.10.50.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:50:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <1ac7be34-22b1-4d93-9957-fc7ade9a2649@lunn.ch>
Date: Tue, 3 Feb 2026 10:50:44 -0800
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DF13B121-56F2-4987-A47B-99A20E18554E@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
 <aYIYBheQgIN71os8@smile.fi.intel.com>
 <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
 <1ac7be34-22b1-4d93-9957-fc7ade9a2649@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_105058_175600_B64642ED 
X-CRM114-Status: GOOD (  14.93  )
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



> On Feb 3, 2026, at 10:31=E2=80=AFAM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>=20
> On Tue, Feb 03, 2026 at 10:14:49AM -0800, Abdurrahman Hussain wrote:
>>=20
>>=20
>>> On Feb 3, 2026, at 7:45=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>>>=20
>>> On Mon, Feb 02, 2026 at 08:37:23PM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>>>=20
>>>> Use i2c_add_numbered_adapter() to allow platform devices to specify
>>>> fixed bus numbers when needed.
>>>=20
>>> Not sure about this. Doesn't it break the current approach? Please, =
double
>>> check that.
>>>=20
>>> --=20
>>> With Best Regards,
>>> Andy Shevchenko
>>>=20
>>>=20
>>=20
>> If pdev->id is PLATFORM_DEVID_NONE(-1) then =
i2c_add_numbered_adapter()
>> falls back to dynamic allocation and calls i2c_add_adapter().
>>=20
>> Many existing i2c drivers use the same approach, see i2c-pxa.c and
>> i2c-pnx.c etc.
>=20
> It is not about if other drivers do this. Its about does this change
> the behaviour of this driver, so that I2C busses get different IDs
> then before, and so cause regressions?
>=20
> You need to explain in the commit message why you think this is safe.
>=20
>    Andrew

Before, the driver was always doing the dynamic allocation due to
i2c_add_adapter(). So there could not have been a system that relied on
consistent i2c bus numbering. Even between reboots bus numbering could =
change.

The systems that did set pdev->id and were expecting a consistent i2c =
bus
numbering were broken to begin with.

This patch won=E2=80=99t break any existing systems or cause =
regressions.





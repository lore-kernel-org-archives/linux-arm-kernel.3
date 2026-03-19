Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81C41091911
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vuEZXO+CHfhAxsJIRz0BfZWZ8cKEPZRDkRGOrY3EjE4=; b=ePiuSuXP5HV+OAxzo0IxA8ZJ9u
	QHW11N+CXySGWwy33yHHZv3ouQ+LFxovUo3kC06r5f4ZgOj3ExW1CiU2zVid0ZO/eSmWOXehG3Oqg
	JXKaeAlqKNG8chxqfGzVXoNPbi12oCGGcdx/e3HMtmXEnFrgA988NABzfv1IFV3dPDSFa8sRJE96D
	DGhPjChKGE4oJrAUzEDIJL1+1AkdNWyR0GiWRajw5vSW34qslhyvsJ0W/B9ihRfKCuWwiZoYcZrQ6
	G3RX70MBVk1RyZnhK8bEzWwcHzf5BT5lWpemwAYe7eKOP+IF1BvrewSuuaHCRC46bHgmteiCLB3Ub
	wM/ww5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3J8I-0000000BSQ0-3Owo;
	Thu, 19 Mar 2026 19:34:14 +0000
Received: from mail-southcentralusazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d10c::1] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3J8F-0000000BSPf-3hwW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:34:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdDg/17em3Ta0DqUlLoQKSl31yYOn3T8+Nu+yerwf4Qz0Y/wyGpxShmZ2BOLJuHpT/9iX75wNsBtIpvwXuGZ8lriyT6O0Nb78TOj+UOYnkhPR0B8qwrJME7AHiXqqiVm7zkJdx9d+msCnpjwIF78Gy+0bM2d0XEXQgliOsWgDx1dJty/ng3sL6QA7kSM3bZPISIm/6udgOYRYhHBEvVah07q3llIIOhWbM5a5lDBeQh94/KAcFVZxfRWni7Thx1q9uFKMY0XOP6RWk+o4W0Vp5TCsXqwz4N18LDChCF1ni17pb1aDf+lDWZv/dHnQfSPc2Wizqvn+/gISUnr3rzlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuEZXO+CHfhAxsJIRz0BfZWZ8cKEPZRDkRGOrY3EjE4=;
 b=Mjkwlvak/gohmbE+QRutnO/BVtHyMhxXXV68rL5FdyCwEH6jNVqan815M2bA0stKTeHYjkPimsJk4DUmcJuqgaa2VxUuC48T+onc2Cf5Jnulz6uSrqTRQkhIU2URysGbt2X0poUa3aXU360QRH4hPqfSCx2Uzxn3tfbYykZigAYZgK/r+LEa1vYykLJkQ3yr4ZtdQkVMMzrDJ+ArlQaER5NNtQNtXSKfnAZqOpdF91bNcjB1Mh3NXkzNTiNzDYGA1sS5DiNfqkBYNocRh2zU1mk+qCXaVWHUMq056oArHyAgcD5GViO0EM8KvwXUH85btm9ldC8fI5PGE2cFZHiT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuEZXO+CHfhAxsJIRz0BfZWZ8cKEPZRDkRGOrY3EjE4=;
 b=YbfD0pgw50z8V3r3TcCDq1oGOglCDzE6IeVjP3Fu3UGzqCI8uL0v8EIiboeRhDC2BEU2qLvhi43B8th7Kf+m/gO4byzEAwY21P/kNWyekMfpMQm6ueghcmoigc36tY7YwNtBKmL3jTvS6BYiCdHbKjQkvId0+sSKnlrRg+8JDs77bUmeMuLIjiSiOsbBwVsQsZSzbA4ikpDnRXIZiCNPWeI541KgQQE7TliC+xOIkrj0GlKOHp5N02Ai0UxSjd+ek09+Uz6ROgM+4c4sXGLOw1ejsJzLJz6xh/KXpYCMbjUT5iSFTZDpHpmS5H3NhXtS3+wT0bIqMuROXbbYCzQJnw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY1PR02MB10410.namprd02.prod.outlook.com (2603:10b6:a03:5a6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 19:34:05 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 19:34:05 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jan Kiszka
	<jan.kiszka@siemens.com>
Subject: Question: interrupt randomness and handle_percpu_devid_irq()
Thread-Topic: Question: interrupt randomness and handle_percpu_devid_irq()
Thread-Index: Ady31V+ZSsTYWzWWQHqFSgsURDyuCA==
Date: Thu, 19 Mar 2026 19:34:05 +0000
Message-ID: <SN6PR02MB41577F8265CA23C3027364F7D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY1PR02MB10410:EE_
x-ms-office365-filtering-correlation-id: d0296db5-5f0d-4b25-d8e6-08de85ee7b53
x-microsoft-antispam: BCL:0;ARA:14566002|15080799012|37011999003|51005399006|31061999003|19110799012|13091999003|8060799015|8062599012|461199028|40105399003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?kIR5ruHYQXZKYuxpGTbNWRGThIKbUZGZQxx6uf9GJNMu9Cq/hLA5wIQzUCus?=
 =?us-ascii?Q?Yya/pzoPCysydvOaV4WuoVImuf3gILwJ9SMEp5tzhQ604QulfILTTOyonKlL?=
 =?us-ascii?Q?XqTb+bSiXcyU89hFpvL6caI6V8ljf8vq1EDJ8Y3MXQlQwEPVz+ow2MbEdyzN?=
 =?us-ascii?Q?jB/lvIp5ejH0J3vHFfn49CJOJ8S0Z4x5+Zf9YvtFYZ0iYEMq3rHJAScAi8Bc?=
 =?us-ascii?Q?n8rbboHKTWNNS96T0jGO8kIcFX0qSMY95rtd8wPXPjZvEG5KJEwhzjm8j59V?=
 =?us-ascii?Q?k6G/EOsYHmiskFdFJHVqvBu6qrb2navpP9XnBM/p9THzqU0WKNwvZaNatjCj?=
 =?us-ascii?Q?1XIwVwT8oLQNiGzfBbbSaJlKovUZlt7nJKpIfgHIOdN/HkxydOjIn3St2Mao?=
 =?us-ascii?Q?Uohn4bwFSnVGKQymVYb84jOJIUykU+3xW7SUiL9Pv/Fl6AgiuKntbxX4Z4if?=
 =?us-ascii?Q?zR7bu2TF6dg1eTmsLTX4SoKX4J67JpbuCjH6m0y7zgg25YOp4ZkPd5adbTzs?=
 =?us-ascii?Q?wgJPwIljuaWvzBfy8wSo2Dzg9nicTjjE2s4JaIvdLy7/k8vbuCj2L5uZ5ijL?=
 =?us-ascii?Q?8CU9IroOjBpe8vOv9TQcdaNndy9PsdS4vH+GsevTv4zFkDxFVFtB+QBD85OE?=
 =?us-ascii?Q?RwwfdlBQXO77j/TMwHkCA1VjUKXzhL137pcU1HmcFE6hyZnW7Qe8H4By+b+D?=
 =?us-ascii?Q?qpVhHR5S0mmsb9cXwTfbejkSRvB3yXWDEUz7nmrLJNsmTMzahrPS/r76Prx8?=
 =?us-ascii?Q?zJt9H7FtRKXvqMGe2mx/OAO64EXFkSUvBiwKYuD3ioBwIVvI3IbrEh0gAMtp?=
 =?us-ascii?Q?xdksAaUgBbt42kZ8VBzfWwLBJuih3Oxhg4KB3LgSqykcZiS2QF0URb8hu/Hq?=
 =?us-ascii?Q?KYTPSUgXu0d73285RaqVgnGqVXKMuliPQPe73aFy6Tf5gHNhne8uf+9+2tdZ?=
 =?us-ascii?Q?Wi8lhLmEr8WRvTPl5bIWcDInoRWE/LWZS8byDcCkfKI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PykkI1tiTrfGFowpZPIyRyFxLtj5/SRFwTqmeJ5AR0w5nSJDG4aI1SFnvK4A?=
 =?us-ascii?Q?2vdcoI2aIjqjLoWGffeGY8W5s4S3jGc6yMa63cDFacSR0OEUpUkwN9IBfd0c?=
 =?us-ascii?Q?KWj8mzLazkpj9odQKZN11hneEC1zBLmhviwPMwLgejH0z3LMgc1VF7kBJDA0?=
 =?us-ascii?Q?us+bZqdFJ9Jqt/ROdfZ1zCKEvDvTpKOIe5omMUlUS/p8l3M0VOFAv/abcwBl?=
 =?us-ascii?Q?kF/h6+ksvRtTEq7p9AFziHjgvzw+UORvbgdWZntPfwm+3YijFNhvB2ZXBgYZ?=
 =?us-ascii?Q?YMprBGvb0e1m4rhw0550XWl45ju03ubvts2TBJurt7zwBXUObRBD/8bVrZTf?=
 =?us-ascii?Q?ABftJvzUwO2mkuyBVyU0ETOr9QlsssH35Jdvt9wzqqXIlZy2kDks8aW/6RSe?=
 =?us-ascii?Q?v7+emN2PEptXzf9lLbhSrqq3LLRmM471UwAwOYF0bEtm6NQ6w112acyCyQdy?=
 =?us-ascii?Q?RruV+Jjow3jPqNwx1z6eN2R5BGj3/XkqsOwcUmSJ0UGQqnvJ4VvDqFSZLbXz?=
 =?us-ascii?Q?968M2u0J/GWvZK0j/f+4pKCtDAbjWwyIqt+0lSasloqCgaIRvalKYrje/QLt?=
 =?us-ascii?Q?ZyJ3QGODirtad++mvvp9WSljF0VBqwqsRLea8unnS7URTn+xkkm7uc6HeYrz?=
 =?us-ascii?Q?OFEOz8NMkYwfk5u2b88jG+EzG1DgvKs2uRGxiCFZDus3Aqya1ZijAF4UiB1B?=
 =?us-ascii?Q?VT9LJLRrEii9hIA7dAVf55DFdbAN7fdA+Hh6fHM6cWEwMkzN2zRXLRz2oivY?=
 =?us-ascii?Q?6aYVv/0XROuQBW+U4a0zTlgEMb5AlmiTo5komyLy0d8lLmjpJwfnnFBgQXCn?=
 =?us-ascii?Q?N7DN6ILtx6mjQ1vS2iIA86sJENkMFILl2jjccklU4Mxc/J3vmfEMytc6vVPb?=
 =?us-ascii?Q?wRnJSkSVUkDXbFvDs5av/2k5JLVaHUUwsjwoYxsPZCoeWNRA/NQv49hKFps6?=
 =?us-ascii?Q?FX0Ld77gNeP92bmsCFXi8idpVIiJl4jWNtVPKPYiq7nNEQD3Xqp8joh5bJl3?=
 =?us-ascii?Q?Oa6Olr7tRKsulWo+nUhuw69XCG8xMRldPjaimuk8YgfRGfFIlq5z75IsU8b6?=
 =?us-ascii?Q?E9M2g3PJ44u7C46l+8mTsejJJxCT/rpmRT+L033dbahXoAJT2ni4bV0Y8onu?=
 =?us-ascii?Q?iB5eIPwWGjAAveg3rZwJ2PQRqJgh+70evQd6W4nuMepxkdco7KaP3DSVroHF?=
 =?us-ascii?Q?X9TjN86iwcQmcO6iu3M8Oz/EAb0kYRYytJHIFwLg2DXDR4sHXFJa1v1quAlz?=
 =?us-ascii?Q?hjKGIHuBK15fgQuvxRfmpYq2OzREVzET0mHke78824g5KIO3YuCFnRVjVdXS?=
 =?us-ascii?Q?xXoZYVnxm0aG3owIX9/QV/hnu3Gz2dVi7dikgiWB7EyuJyJcwf+CveITTZYR?=
 =?us-ascii?Q?3gTs3O0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d0296db5-5f0d-4b25-d8e6-08de85ee7b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 19:34:05.0614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB10410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_123411_953375_5C0C0E42 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

The function header comment for handle_percpu_devid_irq() says that it is t=
he
same as handle_percpu_irq(), but with the addition of a pointer to a percpu
variable with the real device id. That makes sense. But there's another dif=
ference:
handle_percpu_irq() calls add_interrupt_randomness() [via handle_irq_event_=
percpu()],
while handle_percpu_devid_irq() does not.

Question: Is there a reason for this difference in handling interrupt rando=
mness?
Or is it just an oversight? handle_percpu_devid_irq() is used, for example,=
 for the
SGIs and PPIs on the GICv3 chip, so I wondered if IPIs (as built on SGIs) &=
 PPIs
specifically did not want the overhead of add_interrupt_randomness(). But t=
hen
GICv5 is doing IPIs using LPIs, which use handle_percpu_irq() and hence *do=
*
add interrupt randomness. That seemed inconsistent, which didn't help provi=
de
an answer.

The question arises in the context of Linux guests running on Hyper-V. Hype=
r-V
VMBus interrupts to the guest are per-CPU interrupts in Linux, using a PPI =
on
arm64. So these interrupts do not call add_interrupt_randomness(), which is=
 a
problem because these guests don't have much other way to get entropy. To
fix this, the VMBus ISR has always had an explicit call to
add_interrupt_randomness(). But maybe that's not the best approach, and
handle_percpu_devid_irq() should be fixed to call add_interrupt_randomness(=
).

Thoughts?

Michael


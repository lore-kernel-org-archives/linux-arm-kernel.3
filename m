Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0B6D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=; b=Vlr9LYBgCfep/+QBiZoFRWZC14
	jruKxO5Uyr3K94jx/BunV7a6Cx7/dKSXPsRSkcSVF1IqSMifBUQ3AlGNdOPM+1jI/t2m2yzXXeoAc
	1Sry3gGM7DnNg1UBKjGB/MP0HfNN37wj4bw50sAUu2UMOxTaa7BXUxEdKAv8VkD5w2+ODTRIsIS2r
	tVo8HuBZSffjgTlraVZTetza8OvSVmWZ9K5zbVng7qWu+gp/0RGm3fILVmpzyMdFlv8DFfqYmHEns
	e52PjlhtUDsAMhUI71SNWi1bJEOmBU3Dgsh69FgWH3e2XenPp7qygGxTNOUIZHPGajuGNSDq8g9ll
	bHr/s57g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPe3-00000004rth-3opC;
	Tue, 16 Dec 2025 07:38:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPe1-00000004rt2-2Pyg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:38:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG64e0H4174109
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 07:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=; b=XTFIjUfvzx+0WxwS
	dxYZGhHRtRb7qI1JBA4pcqy6vbKSOyzJdExYWJot4nyNC5bP1PQTwaol4/9nrFRR
	cNpfYq+0xplBniApzuR6QM64JR4xlSIG1ySWQmd+F+q6RI4c/HRYUQu+unYmDuNv
	ovH/RzLAz31fw6dCPurnScEOA3yMEOiKC7huhtgQOpmNCpjlfq4Dztq5qNeiqYLY
	jHTLvHGqClBMGi7s6HFS3MNm4vkXZAJdCNq/6X4u1Sqy1Q4F4BpI2jYe9sKTsM8i
	1uZY0wuJCCs9kowVxYLa+FqZz23OiYWlzDcNPQ/wsbuvItrhExVtvoTS5xD/yNst
	ibD+sw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2ks039m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 07:38:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c1290abb178so4879689a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765870731; x=1766475531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=;
        b=ifSRtseLxCv1bqS8Gdj+HfJOSl72dNptkWoXQTBP3I7q6eiqBCBT4nzQynSuo1yJ3I
         MT5/mGWM9iTvo+yfDwiKTSbpxu1Nc8cdGQKNAI/1y6qLH5w0cpbmjWyDSsdNPr3X4cFn
         v7K4WjAJsIC2mcLUzON3o+qQt/hCMxZOGLz/fyIBREnxtW8KoiE7orJ2AnfiYmfck1jm
         rMQZgI0ZrekbsR/WHk0zAyC06gocl6J71YZ9jR092r67XHlc5MkboaDPxphryteCuHEW
         L3c+PZQhrw51Rjcoyzk4ramYHiFqiMeXrRrH/ou/BpdOvPPsVHS62+wxIcgd6uheEy5H
         tOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870731; x=1766475531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YmBFkv7BIT1XO2FEXzhMg2xQ1XFzff8WD9iA8ZhYH0=;
        b=cwyLpXZ75b7PoPm3BSxLLl8BwvCB3kk2VqKvtj1rFgF/SXBo29yEaWzTfdjgdNwEOS
         9nhjg2D4b1T87I/AxbhKeVthlc3zkhqnfWo+R+ZdW2Z2NquxC27LXS/xJLbhA7xJWcii
         V8fz9BnArQdkaimseOoRSiHeBT67PAczRUPOD5fJ8esQkifXfTlGAznKDt7SgW9zQn0o
         h0bTMAetAE2mRt67ZP/cQgS2JNTwMmCofvnXZgLjvGyRNMme31ykeWHTSkWQq9InMZGS
         s7kcAZ7JUpqgMMx5fzobCFN1NFFcC5sqQrJIsLUyJ902Nr/oQJ7JvNPXvd3Uo7OURzPj
         r/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVcHJHUlKHK/fr0SlvysAlvyceq+25D+08bVqwWi4X14vo0Q5qwDH8ALKouffmcClmwzNgsBA7N09SbKlwJgtLk@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMndyixLd2oe9/vpxCDIJtVs4uun1KIpOlG+PYXVJ4lSzX3xb
	8Nx3L1XB9nHjRg71mQT5wVUSmw026+T0AdFrCyFtuepNwpgEC9ehtAlsUj7Cn1OI+QQNo1QIbPX
	UtLlEB9xlEVZGfqZ8GlvcV/DOePr/T3W484m6leKlwgZoF68dcLgmvPZQMmZnWSPCOitJY6Mats
	hgL3MU2He35vd05Y25AAM3rCsdvuE52ff8NMc9rBgS/JMN7+W5lXst
X-Gm-Gg: AY/fxX7e6A4ca4KH//BmxpAvizdvwSHdFTyfRZUUWwaTh0pyMHTmFfRYMT3XHH0OJEM
	pBXpl70eKj2SPTUW3Qv4oBV06QPVqHwjqRa0YApjmXztRx4Rq8v+x1+8HcvHmPPlzpUq9GdaaBN
	k9noC9XoFv38BjEP94aMFN8Kep+OQPziVswbrXUcUPywLNGIg/jg/JhxiIPDbFxeu5JLM=
X-Received: by 2002:a05:7300:2a9b:b0:2a4:3593:6453 with SMTP id 5a478bee46e88-2ac2f85e872mr8049904eec.3.1765870731069;
        Mon, 15 Dec 2025 23:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgAxeScCHPFScnumP+kyrXe4heJGwYVQRSxj+hObliMSDxJWWHv5hYUxaMExJMrxhceQO+g6cVj0vLQa5OEdY=
X-Received: by 2002:a05:7300:2a9b:b0:2a4:3593:6453 with SMTP id
 5a478bee46e88-2ac2f85e872mr8049887eec.3.1765870730525; Mon, 15 Dec 2025
 23:38:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
 <aT--ox375kg2Mzh-@sumit-X1> <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
In-Reply-To: <dhunzydod4d7vj73llpuqemxb5er2ja4emxusr66irwf77jhhb@es4yd2axzl25>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:08:38 +0530
X-Gm-Features: AQt7F2pIGEo3k7l40jiSNtQzSXPgQLv36wLttu_75OXJz9aTmVe9GGZBfjh5ELU
Message-ID: <CAGptzHOOqLhBnAXDURAzkgckUvRr__UuF1S_7MLV0u-ZxYEdyA@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] tee: Use bus callbacks instead of driver callbacks
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Olivia Mackall <olivia@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Michael Chan <michael.chan@broadcom.com>,
        Pavan Chebbi <pavan.chebbi@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
        Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        netdev@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: sjcA1DPhOvfEBmp-yZFLitOHcDxRXTAW
X-Authority-Analysis: v=2.4 cv=eZcwvrEH c=1 sm=1 tr=0 ts=69410c8c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=IpJZQVW2AAAA:8
 a=sfbzD7rgGHNppxHmi9UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: sjcA1DPhOvfEBmp-yZFLitOHcDxRXTAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA2MiBTYWx0ZWRfX8FsXZgcKpcFV
 yaz6dm6/NE/Q+legt+3duAnNCOpgygPxValqNAKdBx8ATiCr6RskMU54vUNuNP/zOBaturpd+8T
 WlEh3PNOWPQHpOPRRHD/UmRhMyBx5gBr0FQtTJ9ELZbsVKGc2EyBt/gy+wUlHkbkZwh4WXBOls1
 ZzbhwykRNOODGUbVzMy+wz+ytwv0OL4SNw5WOoctsPEtAyDaGULUtOTFZcQIGqEyjs2HOk+fieh
 +iOefnHLLYEBy5RZ3TWDVOb5s+R898VpOUxN6OQuVIKur8E8jtu7BAPmc7FLIAcqTqTmDJ5elBh
 8v8B6J77V7exAnyqeXzR68Mm8zkhxPltR+zj7/EyNfrFCXJjyOqe4/yI2Hp7ZbZBgunhX4OlvL/
 IDk1PFo2SOTiEjY4Sp4I88EHO8r9dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_233853_623261_C30A6A93 
X-CRM114-Status: GOOD (  46.64  )
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

Hi Uwe,

On Mon, Dec 15, 2025 at 3:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Sumit,
>
> On Mon, Dec 15, 2025 at 04:54:11PM +0900, Sumit Garg wrote:
> > On Thu, Dec 11, 2025 at 06:14:54PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello,
> > >
> > > the objective of this series is to make tee driver stop using callbac=
ks
> > > in struct device_driver. These were superseded by bus methods in 2006
> > > (commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
> > > methods.")) but nobody cared to convert all subsystems accordingly.
> > >
> > > Here the tee drivers are converted. The first commit is somewhat
> > > unrelated, but simplifies the conversion (and the drivers). It
> > > introduces driver registration helpers that care about setting the bu=
s
> > > and owner. (The latter is missing in all drivers, so by using these
> > > helpers the drivers become more correct.)
> > >
> > > The patches #4 - #17 depend on the first two, so if they should be
> > > applied to their respective subsystem trees these must contain the fi=
rst
> > > two patches first.
> >
> > Thanks Uwe for your efforts to clean up the boilerplate code for TEE bu=
s
> > drivers.
>
> Thanks for your feedback. I will prepare a v2 and address your comments
> (whitespace issues and wrong callback in the shutdown method).
>
> > > Note that after patch #2 is applied, unconverted drivers provoke a
> > > warning in driver_register(), so it would be good for the user
> > > experience if the whole series goes in during a single merge window.
> >
> > +1
> >
> > I suggest the whole series goes via the Jens tree since there shouldn't
> > be any chances for conflict here.
> >
> > > So
> > > I guess an immutable branch containing the frist three patches that c=
an
> > > be merged into the other subsystem trees would be sensible.
> > >
> > > After all patches are applied, tee_bus_type can be made private to
> > > drivers/tee as it's not used in other places any more.
> > >
> >
> > Feel free to make the tee_bus_type private as the last patch in the ser=
ies
> > such that any followup driver follows this clean approach.
>
> There is a bit more to do for that than I'm willing to invest. With my
> patch series applied `tee_bus_type` is still used in
> drivers/tee/optee/device.c and drivers/tee/tee_core.c.

Oh I see, I guess we need to come with some helpers around device
register/unregister from TEE subsystem as well. Let's plan that for a
followup patch-set, I don't want this patch-set to be bloated more.

> Maybe it's
> sensible to merge these two files into a single one.

It's not possible as the design for TEE bus is to have TEE
implementation drivers like OP-TEE, AMD-TEE, TS-TEE, QTEE and so on to
register devices on the bus.

>
> The things I wonder about additionally are:
>
>  - if CONFIG_OPTEE=3Dn and CONFIG_TEE=3Dy|m the tee bus is only used for
>    drivers but not devices.

Yeah since the devices are rather added by the TEE implementation driver.

>
>  - optee_register_device() calls device_create_file() on
>    &optee_device->dev after device_register(&optee_device->dev).
>    (Attention half-knowledge!) I think device_create_file() should not
>    be called on an already registered device (or you have to send a
>    uevent afterwards). This should probably use type attribute groups.
>    (Or the need_supplicant attribute should be dropped as it isn't very
>    useful. This would maybe be considered an ABI change however.)

The reasoning for this attribute should be explained by commit:
7269cba53d90 ("tee: optee: Fix supplicant based device enumeration").
In summary it's due to a weird dependency for devices we have with the
user-space daemon: tee-supplicant.

>
>  - Why does optee_probe() in drivers/tee/optee/smc_abi.c unregister all
>    optee devices in its error path (optee_unregister_devices())?

This is mostly to take care of if any device got registered before the
failure occured. Let me know if you have a better way to address that.

-Sumit


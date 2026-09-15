Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5775FC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=; b=QO3SeI+0YQQ41gWftdphUAeGie
	rv0qdO/LE14c2qAgztpSJHKhhiSdLJgz1+4ccvacdJLdRLn+Fk0cArtenWk7EghWVDvQAQLTkmmvt
	56lMSnwKTwXtI8sHxd7+ZG0b77V0bjt+5zJZap5Hkwh2s3hUmj4CQlXxR82rVpldkLXLCXDadxOi9
	eTJoE2Gv6si+4BZP+vbcFBO7blaaFjjIHHD4x8F5Bj78PM85XQFirxdErqRrhdx3aXrctAYgedY7X
	NbJvsdwo5NXmuVKHWy9EWmbCUaOzgAtzfwyp4gQsXOiY0PJW8GgvouvnY4q7oaQ/DExAm1qLphccw
	lPC57ddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VNs-00000007HQG-3G7R;
	Tue, 15 Sep 2026 15:47:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VNq-00000007HPN-2xJ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:47:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAW08291046
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=; b=UuqQLGPi6RwKHBON
	dYUZOaX4xL7lhyYzbVQ+38hF8V4hkwKxj8i7ct7SGEuUwtQU8gbbB7g9UFQVcLTE
	Z9tY0fUXyRB7+fOWh3KJB+Ub7YhF1wNtr/PxkTmL+gOSSfOhlQ1TGNi6kDBtrTLo
	nqVKJxSpdNQxR3kQeBsSI3SrMYadaIQZiHpHEef7O3mbT5/yg0+C10wCcyQI4OsR
	5xBRxrFWQM8PNaAiEYgHiH4SyqdbGaFk7TgmFuQsfCL+PM5W4F+TPiUecdTlpnqk
	aYHpmIhDlByW5YvtXqGMWxAi66Fx8ma19WynfSsXmu1lFrZ6NfK/fwG7Qv5uePuK
	ZCXEcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux2p0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:47:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso105069435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789487264; cv=none;
        d=google.com; s=arc-20260327;
        b=k9KfgF74zY+zgBXsUgh79hHXPBsi5X9ArMeP3+ojJN8kk8XI+bci64I1keXV/AXpwH
         bNE++Y263q9Q1YKoJkoRB8NnYtXy5C8t4hgZSr3t9EEIUx4J5LpoVTMtOc4gZant8V5S
         KC1wDiISz9Y9YNblU/hWW3smZoxIQNG0WdGUqeSZ1eFm5ACXo96CJfk32JvA2o481uNO
         MhHGJfno4t/Wh/nGtvR26l2pWT+BMgC9aURUh71b9uE/SnQWHvYq4+pyeEGizu1i5e9t
         pIgM8QTxbRXV7ImEeYzB7Db5lZK53rrRH6J4ptZ5Ob9cWu6dx+tA9lrWd4FF6AJIsa3T
         H5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        fh=S09yzrDJGiiQFK6tWImrOE2qGZU/kXnKHIXRD3L5m+I=;
        b=olmOsyEaxmAbK3gVXGfb506LuksVYMTfSAw/LT4f7lcjCs8gUYewsPgzMLhVGJCH8Z
         SxHIi9ilRzvjKKmRhsdWxcyWYSCkZS/aP7vD1zWRcyDhSa6CBf6+HG7NMsyEuPoRF/Tl
         U4yTW+7BGcjZcF6cAJH/vW4bNqhZkNwcbBwhKrcnTbpKGXbErM1yAQXHsHjpFCQOS6GT
         FsmAA5sttrVPoxcKkNqTf8bvTGqaIWBxYUuZkRKlx3rWe0SFkLOpkh5atxKeGtW09bRw
         SM9RbvLERK6O4ho3OeEcIOGwzMxbAA5R3SSSw70vFh1VgGHeLtD3tVVWyhVoLIklFBXi
         qdjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789487264; x=1790092064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=QUZn1RJ0+JowhaWsjeLT9WSRzyiRaXFciLg/BW+Dgp+/gpW6kj5RxYpC6U+jMcFWzz
         RjGhvKBEMA1uLZBSCpG7WZf+FkNQLdlqdwyzpOCB0TqeIYFjuoQEuEti3e7e097PssoP
         6KhPW7zSCgBYM2I5L/KChOCqyA/+E3KYTQbgNiUTkyv7QTnsExTkP1jSnn8p2Qt0fPp+
         EdbHdOpqSQU5vIeou7fMlubNVPBp23GbZJ2SCrqtHtg2wSsv0Zre3f45/AADwSxyuPvb
         prhhiNutDKI9on3zeQI7lUnrcwyhd38P/RfxRmBn77JA7ooFInIeGY7KCmYOYfOcq55H
         /Quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487264; x=1790092064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YU/40tz1OiGsBRVDJIrOosPM2xe9ZXCtd1OUPGAbvho=;
        b=zYx6Vcu3GvFR0tXCBLxOKXxkCcp3p1yOTpZ7i1OV3GfubOiGLCwUrriqmikQnhJMTe
         uYqouXPPhZUQmHZM9YQXuJm7kf3p/SYcEMY9Cqdqq93K058hENkaXAUHiM7/rps0wwT8
         8PyjBmKbPk/RE2MSQCS/EDz7cnbedRHtigCrgOPE4ywk/FAxOCjnklBGRbY152L+03oj
         t8kovj5yEwBRLFOI9aV+6pUB2xA/5O9jD9nzingteBQ6ghebykRtzG2ZLTLYsAyqwxJB
         Ry/fQqKgdrB10yuL5BnPg5DCWJ9r7UxGXD1UK0Q5PD1+szkPJgOcdXxjRrsbrqIaV91C
         YCbw==
X-Forwarded-Encrypted: i=1; AKwUvBzZUiS3pEWkKUD6kEuIhzfD4m3gSwt0N/voyVRAcKKGOPj28U3C6j+VTHuLtM128NBLfn4y8Zu9bNlWnrOEOVNg@lists.infradead.org
X-Gm-Message-State: AFuF++l0XtdKYeYhbHrQFT6ZwfKghnRG3+Iqy68Dj57xMSjeQkhDB+/x
	QCDpeXERDEsQE7Iqc+cq9af+1ndmkvvbeOmW+yIUBtLLQfaIcstoury33rj+YcULI22IqnFTYsT
	JnTCpAR7y5myLLarTcXt6Q44tb6DyQY0PR8IAq0cc/FEP7eMQdKF+gdX82K9ksvoSC0SNuQDL84
	mzoKZEQsyr1fMijJewU84E+ghR9zkmUYILCcfvuz0YoIFgzIAYchIO
X-Gm-Gg: AYBFou3WINt/82BZUC5zHZLOMObePrCbSrE1PuAv8mYCysO3Flys+lXWminZGbjBsgq
	zmu8MAn5WaTMAUsM5azXSfgDf1qQo8Gnv+NKrtHFb4mkMUmwAxgU8hkCpa165nZIupIIBhBqP8L
	jHKF2eAVPY1dPt9rWXyIAOsiXaLfonnBxp3XpbxjgGMmH4OpmW/YNlkTUL7w==
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2dd837b0f4dmr30164845ad.1.1789487263769;
        Tue, 15 Sep 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a17:903:3c4b:b0:2d9:b60d:7755 with SMTP id
 d9443c01a7336-2dd837b0f4dmr30164475ad.1.1789487263399; Tue, 15 Sep 2026
 08:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com> <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
In-Reply-To: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:47:32 +0200
X-Gm-Features: AcwNN1XLltJ2FYh8c04_i-F6ztWC1xrsL6gII51QJfaGjk0kyDplWQBNgu8CYL0
Message-ID: <CAPx+jO-Fh7RDmHz-YH=odsHxmqYaj=vj4R9iUSSmbSqcRr-p6Q@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Ulf Hansson <ulfh@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Qingpeng Yang <qingpeng.yang@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfX+qbTyY4ZRkUr
 9eimMHy8jOOjKH9RIRfO5L7FQmxl3/QtZWNvVI9l/CHOuNUolbM8b87jipFIspIPRrkb0EAfiYO
 w7vUlGgOL2MjCePj++GWmWqd8eD8MmIrYWZbNAeoH2zXeka54U4Ld6utaPKTo7JBIVRRH/JmzBc
 cQWf1c4F/rftndyyZ3RAbix5HHa+N/4IVmejunt7KPLlhWuRW3nBPm8WAieVA89pJGpoFyxhUUh
 aONrMvtskd7izeEiC87jfKyqyVTXVCbBjiLmpUjBn+SbYsoAsaEqx7ANM7rvIKSBsUQ0AnQ7pYi
 wkPcZRcJS3Z+DVIc3WalbF61xv1uonVFmySsGYTTPAJ29IeKIdPHBcYu1VCDKwttBszYJp7N4Jk
 fytdeebQyeL2B3shZt906pWEmz8SKlIxlE06HOZdflJ3SxtCwnNs+oXVRlhQmrc2dDKXC+mHKu4
 YL/8C7BTQN65ucUtW0g==
X-Proofpoint-ORIG-GUID: x3k9GuE-eHP0MloENgd_io7OOWonDbO7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMCBTYWx0ZWRfX4DZ9pdvn1X3T
 /AXi1hFMwBR7lyN67OV4x9Fy2+pQM+zX/R6wK9iSc09KqjmoRbyRqar6+5z1lMXLyQQGWpGu9IV
 w24bum+AXCzy8DTs/+RUOtEUWCnGhHQ=
X-Proofpoint-GUID: x3k9GuE-eHP0MloENgd_io7OOWonDbO7
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa968a0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=mK_AVkanAAAA:8 a=VwQbUJbxAAAA:8 a=BY5PBP3jAAAA:8
 a=PMt6m80IFYFBIeLpiBcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=3gWm3jAn84ENXaBijsEo:22 a=gQW0MTutLl7eKD3OLfcZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084746_852673_0EA7591E 
X-CRM114-Status: GOOD (  18.16  )
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

On Mon, Sep 14, 2026 at 12:40=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Mon, Sep 14, 2026 at 10:56=E2=80=AFAM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> >
> > From: Qingpeng Yang <qingpeng.yang@amlogic.com>
> >
> > Mark the A9 ethernet power domain as always-on since it is required
> > for ethernet online wakeup and must not be powered down.
> Is "online wakeup" a wake up from suspend?
> If so: is the Ethernet controller listed with the "wakeup-source" flag
> in .dts{,i}?
> I'm wondering if the pmdomain and/or power (wakeup) frameworks in
> Linux have other ways of managing this case (e.g. only keeping the
> power domain active if needed).

We certainly do.

For in-band wakeup we have GENPD_FLAG_ACTIVE_WAKEUP. If this is set
for the genpd in question and the device being suspended is configured
for system wakeup (device_awake_path() returns true), the genpd will
remain powered on during system suspend, see genpd_finish_suspend().

In genpd_finish_suspend() we also support out-band wakeups via
checking device_out_band_wakeup(). Although, I guess that's not the
case here.

Kind regards
Uffe


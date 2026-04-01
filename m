Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E8107637F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSQ6pTcuTePG32M6XmGUQnNRHQHNKydM20nRxn05ChU=; b=yIqvMleL3BWCYjwKDBOhVmZnYB
	AOaKEDjTonC7q1mmw+ZhrqlQBdJ0COdDj5RGJhT0eEYzHH0LHOTP0MFXyBQAUzgomlk33TpHf2YpL
	smRtFTENXOf8kMSKIpyPsGmrLlxmVChYiTaiM9tVJ/vcaN6J/OGUH8EkdfWV4buq3/87Ax8WRGtkx
	AWdHpQDfncfwuZHJOvpLrvPmtbFlGcw1Oj0rKXig+TbmkGgsu4+Icz+xL2czNE1LgYH03XVEnWpjK
	s/BGa5EVI3wJJ46sCerKL/6MVDN00PWD00+wJfOO3Q2qrRuZF1423hUtZAO0NpnrOcRVNMDAVI0pp
	jZccX8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wVK-0000000FTwE-47K1;
	Wed, 01 Apr 2026 14:25:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wVJ-0000000FTvw-3ytg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 14:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gSQ6pTcuTePG32M6XmGUQnNRHQHNKydM20nRxn05ChU=; b=Zgegc+jjP2rTn7Zzhp5wbvWpen
	y/oyxOXg6JJQBgsfX4CdeGQTVfIs0VSHTACairtOaIurVNB0gmZfqtdh5m1MMqhMG3aHELbOp0Zci
	iE1j/rMbqUUIIedj7yV+GKCe/wz4oVsTEGv8X9lG8EzQlt7izSSpS8nwHS3q5NRfy6NFlRPqfgjb2
	XobwimUcAlvT3HqnCb0ceBwk5PnzIaFn2Dy6FYojthJD/ms0GxWV9pBKOBXtBi5A+pNOrMDbxnAlJ
	WZMQXci11jHZvSViJxCh5TPAYpxEChTCd/J7sKFGY2o3OwY0AwNr9FE+k/l8TLnyq0ROTge9g3T+y
	H4hAHrZQ==;
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7wVF-00000000bUk-40m4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 14:25:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so72647451fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 07:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775053503; cv=none;
        d=google.com; s=arc-20240605;
        b=euPMEALdjH3oaOKri0wwbG5AWMek9vV+D068eqjvUBj+W8DhQAU7yQzgg9uWRGpW1V
         qKtebnA8P44CMgY67gArrU3XWLQ3Jf0zo5w/Et6DJ9zarDEIxBaK9vEj0tph0H+tnt5f
         cmCHkDAeN66MsjWRiYds5aUwiARdoowZ94fYuDveowGvao7HlWEOHinxZbvkC7bvdqLN
         Ewh+QYo1qniwaMV2dHJNNI9Tuq8BoMcxQZdFRF2GhMLpWdbNKdeE2wkrx9LFgUjJlXsM
         PpdTBeH6vGaMuggcQoLujTo+n1l4RQG9zz9QwmwJNb455nwWToSk1bwNgmnG4rFQF0kP
         rpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gSQ6pTcuTePG32M6XmGUQnNRHQHNKydM20nRxn05ChU=;
        fh=BsnOZYcGYyORKhg8HsL35QL/N27ZHVRz5i3lcFOE69A=;
        b=loeNb6a127lOLibQAxBhXAIlUU3JzO2H+1eC7KO8pNYogLn425oSm8rhpZmazm9LTm
         ggwrKgJRZCODcXZfl058B+EqG7OizOulBMDjRcuDQZL19DDG7nn9ZIaqp9zTgRO8IGlR
         B2Nd0IQ4ucK3Heau+UDxYgXcqFrVXy1EXQiKUHnBRAb/Bk9ZU+0PuQHBfC2EcNSitDlv
         GAYsgQo9faWkURlXAaHpQb4UUd5ghO4IcIZZSaGKkGzJtsiHX6kS9NqnqDl8D0qJtsb0
         qMbq55+/lx4Kem+eqs+emw7lBKnw3nim1OOSM5pVXow7YDAD75W3P1SsOyA0xShEQ+pP
         medg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775053503; x=1775658303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSQ6pTcuTePG32M6XmGUQnNRHQHNKydM20nRxn05ChU=;
        b=Qfhxzv2sdKWs9AqjRu9ZqOQVkILTQQgE9fDxy6XkicQCu/pRVgLkE66tg4Zo7TxI0f
         TcpbE73lTYBW3ly9+jDbiLR04MLDyFsd6WaA5DGAjIyeZIDxd1rq1pp+9iL37LCWP+zc
         +ZOUzel8In3zjgfj2JDL5fumcKTfGbouhKIBvNixzPkgAYNWNwAR/5kZvA2z/SCcc9VH
         N1ZIQ8eF8792CfiTDUVem7L3qQRAO7ayfLjFhySHTO5yK5JdOHwC5VJvacewu7/EHCbN
         dtydNm+FwMyHu2HYjuerJ06JDhDzZYGYJU1Azc2xrapgjH0MRxd7T03G2U5rroRu9cHc
         QYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053503; x=1775658303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gSQ6pTcuTePG32M6XmGUQnNRHQHNKydM20nRxn05ChU=;
        b=UOYD7B5rx9a7ttJsglrcmuOg/P4XJIIe+T7l16xreNOdZHawrB9Elhm7dn2NTzozV/
         4Jogf4MT2jGebP8wIAJbHqgTe46q+H6UfQKBR6zV6ob2lL/VAZRwnfE3fIg5qv47eJFF
         EYdDYZMc5Em9CxZcDhZmPSOrPWeYhT3Ht2mzckIVL2/dGGBPNFScQWfjDtjz3r2vqszW
         OBbvIHN0VF3DcF9bbOdISYu+413O4XHWLrlvY0GLt1p/dIUk0hX86ZuvsPcHCaEoidl4
         wTavv0cI+txGDBQvkXVVnYAi0rCEdg3RqILMo4AlIdW22F6X8Lo8zzg6XQr/NWq6Q61S
         6zMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpVe7aofVceCwsPPGBbyriAowCRu4fadqtF7B8QTQjf/X7MXuaAYnzIAB9VFrAElvavILOatUA4K9I+L7SQKi5@lists.infradead.org
X-Gm-Message-State: AOJu0YxV0aYcksD3k3wjmbb+KLBTwiB0refGjcDwk7DC9CKDlUfIv6ya
	9fopsBA0NQ5iDDfcLeo0s5CmSFqaB+IXR/bcJ9t2iSx3sDyz5VJLAp7Fhf8wMNj+KaqmjlM0VCU
	a887rczshUELAhu/s2UulptDVYOgdk8c=
X-Gm-Gg: ATEYQzxzRVK9Rvs5WrubO0LcXbsQgz/WdVI7vkBqVYocLMe1cQ+mQo28pW4jYH7Xmbd
	SR69+ThG2TQqE4aJD7eq1rCndzm3xht/Pqn54a0Z2Yq/xWK5Z/fpc+xccDPDc98fZtjyH0/trQH
	KGNsNYS8vb08HSegxDW3MNypLjdeOkd17UStNK+LTxZI4rT4HpfU9lFcH5CCMfFCUuu1QebaIVJ
	ADAPGoD6Q2xZH2a5Vx4TfVxC+A1734nWccjBSosY59+baH5O33/mDip2dMUEWHdbaAT7EuwKti1
	2JLMq3QL1d33IorzyXh5eEkrd4a679uoeyJAuWKE4AIAbtLwbxytamSchEJIQZpIsXg4onaRFze
	2fspxm+M=
X-Received: by 2002:a2e:a554:0:b0:38c:3e3:953a with SMTP id
 38308e7fff4ca-38cc30fed48mr13856341fa.29.1775053502521; Wed, 01 Apr 2026
 07:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
 <20260307124118.1d527749@jic23-huawei> <1166aeef-0c93-408d-b265-9037f2840074@amd.com>
 <IA1PR12MB7736AE6EEE95D5D184A15B9F9F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
 <IA1PR12MB77361978ED21FF22F079034D9F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
 <IA1PR12MB77369F79026F7BCB1D9C64999F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
In-Reply-To: <IA1PR12MB77369F79026F7BCB1D9C64999F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2026 17:24:24 +0300
X-Gm-Features: AQROBzBoZ-LI1caYHqTvdlVWNWIbminA0-gaXJPHQ8leXNSCDNAFQN7WnRQJ33Y
Message-ID: <CAHp75Vcg1u86z_TWwz+1Gk9QQ9RB63QmNcqpkGa5HQHZhSE=5Q@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
To: "Erim, Salih" <Salih.Erim@amd.com>
Cc: "Simek, Michal" <michal.simek@amd.com>, Jonathan Cameron <jic23@kernel.org>, 
	Christofer Jonason <christofer.jonason@guidelinegeo.com>, 
	"O'Griofa, Conall" <conall.ogriofa@amd.com>, "lars@metafoo.de" <lars@metafoo.de>, 
	"dlechner@baylibre.com" <dlechner@baylibre.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>, 
	"andy@kernel.org" <andy@kernel.org>, 
	"victor.jonsson@guidelinegeo.com" <victor.jonsson@guidelinegeo.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_152506_100035_05190FBE 
X-CRM114-Status: GOOD (  10.81  )
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

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Erim, Salih <Salih.Erim@amd.com> wro=
te:
> > -----Original Message-----
> > From: Erim, Salih <Salih.Erim@amd.com>
> > Sent: Wednesday, April 1, 2026 2:13 PM


> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >
> > [AMD Official Use Only - AMD Internal Distribution Only]
>
> I am deeply sorry about these markings. Please try to ignore them, and I =
will do my best to escape from them.

Maybe, but ignoring them might be subject to law enforcement or other
legal actions. You must get rid of them for your OSS contributions.

--=20
With Best Regards,
Andy Shevchenko


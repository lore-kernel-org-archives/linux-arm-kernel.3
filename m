Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAA4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 21:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TcJhsAFwAe98ARop3zlCHVHJXLHLIZfv2Lk8irIkx8=; b=YKk8CsjCBPbCF8G+C6xZdAD+if
	g2fTG6yeSBLslBqwk/yi3/gy8KyE6dW+SBO4c8LlLmfAlglyEqbqbxE2AP/+1eCIXUJ4CL0zvzcXR
	KhXXdNhouo8j92LQQeBAXkac5cMZuDAcI3YSHcgAtS3zVjC+qVwJ4uyqFU18ZzaclMLUhJOVFUdTs
	4Pp9cysfvLnElR9YarSSDGg9j6y9z07fyVzjXQvnNB6d+g7C3b/TR0EIEv363wpWH7rNi5xmjJVOo
	xeQIJtLsYfurGypxC0/FftKq5/7nz9+tq7YabDHHSk/o2jRmdLgJQfZiSO93VinC502MCr8Qy9yAP
	+2YB5O8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGdy-0000000H3iC-2PJU;
	Wed, 12 Aug 2026 21:37:50 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuGdv-0000000H3hJ-3sc5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 21:37:49 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-51c15a5b265so33311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 14:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786570666; cv=none;
        d=google.com; s=arc-20260327;
        b=GO/FvUr+QDo7ttZQYmDQj9p4WxhiHiLQfsrJ0ri7OzM2fwfLGK53toFHACJjFrVw7o
         jl4RHBh9YdWB9/qlztXTX9RGhkDbuTxe4n97NO1hhS+uZMUYjRZEyhNm1hMpEqDW2z2z
         blR9pOCEmDsVXsrXZgCQXi/Q73oQdYbXSdNwyhXWXMFKQFTgOvJQDXCIZuOs0yzjCOhF
         nuAg7vnf2xPMDxXxeb8N5JTnbD9Mjhfo7VYZ8HCB0Puj7unAbiPVBwkTmIMEA5116ujD
         tlmQ5R8U8SOmEQ1wOTnh/xqeAhRWmVdY09vnOzvWo53FyuUjby9NcTnzRcciUnDQdb0+
         vDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TcJhsAFwAe98ARop3zlCHVHJXLHLIZfv2Lk8irIkx8=;
        fh=AqDGDns+1xZEb6+saoN8Nfg7FMbkgUUWigOPAKwBDsw=;
        b=g+1+t8lvoVCoskbFQviQb9qPxTrS8qeJQRka+i+46tzKqxuF6nHEYhmbLHIgfXDSI0
         VtkyZ/sYOTvIAX/rQKRMrtA3CLKj+HcamFRylzsOdBTDyWpIWZrDhuYIV+2pkOludj0i
         oUPbVlkGCxlHm1vwsHFWQyezrWQxtGTtT1r6itMc6yZaTgyQkTSpcwkNBONr/d3ntWZo
         m5NwnieLsVuoQKyxDwTiaGywhcc6AKlPPa8Q0dhqZh9EhlDo3Pj3ZU1cbzZ0HVpdmZdQ
         m7aydGbtNueAl5wmd49vPMC7PZvvnIDj4xc5buqIPiZo1Yu1Xzg63lON7sTgYpyo/6sL
         TwGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786570666; x=1787175466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TcJhsAFwAe98ARop3zlCHVHJXLHLIZfv2Lk8irIkx8=;
        b=LEGddYQfFwiAavJjhjog79cR28er0ym+Yb4UUZr0Zq0W/1rMTud4Auxu0DedsNZqjV
         V99q8zRd6vHKGJnEAPFzhz8WGitFWP4QKJu8cfZN79Nr3vHjVy4Bf7tVlJ/BOl/vlP56
         xqPRLQ9So4sjxFbxd4in9Ih7HjWA8y15HVaDRF0wCSmNAWVJLiCSovYxDraBx9incocW
         0/ASFik32TxuV1YDglzNCiPYCF0+H+BVsLBAOmb7ziV1jOm7ufYMf3mmnXmjTRMBkXZq
         D6RaHVWlEj/9r0UBh9NzB0pBt8AugGDbdx/yT47U2wR5tZB1mPMwpoK9iBMqsvNFBagI
         ca8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786570666; x=1787175466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TcJhsAFwAe98ARop3zlCHVHJXLHLIZfv2Lk8irIkx8=;
        b=hP7jneGxM4jj8WsmduPfBkmXuB796xVUmHSJluH1tPriw/lNf39UuzQTTX4ORReBoW
         lqpyrs9zoBFW6QGareTe3H1eKQq53UnCZmMIVD8Paa8l2p7vSo3qAn4e6R2RYmzQ5R1m
         3KVpeGxf2WmH7Twv8xAgbjZUjCZxXpGV+98lSJk6csLTw1IwNclGO+mu+lIliYHni0ju
         FwJX1SUdlp1qUIIbyHaxS4lUsSZm/FU/AllKiUnv6pFgX/S+kam4My17L3E9IVRqdcnm
         bJhUyMxVHDEorsuibR0OnKkYiShoGTz2Ub/qYk56/yh3LxFKzm+LsHDNFV4o0LSnyKoT
         bQow==
X-Forwarded-Encrypted: i=1; AHgh+Rr9BmJgmnJWkGjI+uIqTjywbfYALBum2KcdgfdZMr9G6VSm5O23QDgP43Vc2/sIciBbEA0UjS4eaH3RiDfuJaVH@lists.infradead.org
X-Gm-Message-State: AOJu0YzQSlhZhEwcuTO6pgPcJBSaBXfaSHlUMlsvAwHZfgJuwsPPZ5/c
	G2VM4OxSNewO0BJVMHoipBdbG7+WP0ibUwNb2F1tIlHZT93igQCLb0BHYM03Ue4CA72ZRkP+hVW
	YgZlZLNfvp3sVR6T4vgzIGUOOkBGDqUJuoK6Crrak
X-Gm-Gg: AR+sD10/kkYIjlWwKb7MskaI3zi+Bf2Yv9djoux67Foqe/FwFtNi7oeO3kic62pX9Gb
	g9upMOXEIVR32w23GAnlLha6Ill8xaXJFPAxjxB1X2gd55QWujh61Vns2iZtF87PXberVRhwo1i
	Acpwy3rb3MU0W48s0WSsRT2E90WBj+1JQyFctk7mm8mTLSEbEvjP+XzbgoCvccGHAeUM5SA+kTk
	PXuX4bmtDnISGOthZuw4mS7yr/6fYLEbDHV1C5ILz+hnfVoLFRhlorHXpn7p9hPfee3EAlHL+Wg
	CUoYd2bJqAEri8ohrYzPUKBm6zVXUIusyBbVWzjDM9yrgBjtUS/8AGM9
X-Received: by 2002:a05:622a:8350:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-52d75b5aefamr559341cf.2.1786570666092; Wed, 12 Aug 2026
 14:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260812002728.2283079-1-irogers@google.com> <20260812052417.2361040-1-irogers@google.com>
 <anwuYYxLFbtDmmHx@willie-the-truck> <CAP-5=fW9bH_yd2VF+X1jnem91+dOHPjP53uNQ8x69xFmjLbt4g@mail.gmail.com>
 <anyd_NS4D8KRIuEW@monoceros>
In-Reply-To: <anyd_NS4D8KRIuEW@monoceros>
From: Ian Rogers <irogers@google.com>
Date: Wed, 12 Aug 2026 14:37:32 -0700
X-Gm-Features: AUfX_mx6ue4h2BCdjm8EeHV11VCj8h9Rkk-sVPRcudhHCV3w57x-st3Hu-QMgc4
Message-ID: <CAP-5=fUrvxsJ09BtPy-3beSoypBG6LaNjX1iL4aKMMEC8LaH2Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] perf: Add Raspberry Pi AXI PMU driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Will Deacon <will@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_143747_997911_FB8DE24B 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Aug 12, 2026 at 9:26=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Ian,
>
> On Wed, Aug 12, 2026 at 06:38:24AM -0700, Ian Rogers wrote:
> > The changes are sent in reply to each other because the entire series
> > is visible in one mailbox (b4 mbox), which I find easier to work with
> > and provides me better context. Others use semcode to do something
> > similar, but I've not explored that.
>
> The usual recommendation is to start a new thread for a new revision.
> Depending on the mail reader (configuration) new mails to an old thread
> might or might not appear at the end of people's mailbox where new mail
> usually lands and so might be missed.

Yep, I agree. People who configure their email client so that a thread
doesn't move to the top of their inbox upon receiving a reply are
prone to missing subsequent replies in that thread. I suggest that
people in that position change their email configuration, or use
lore.kernel.org, which doesn't suffer from this bad configuration, for
example:
https://lore.kernel.org/linux-perf-users/20260811083828.2057695-1-irogers@g=
oogle.com/

Thanks,
Ian

> Best regards
> Uwe


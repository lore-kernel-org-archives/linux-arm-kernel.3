Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B69AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=; b=BoQxJ+yzbiUiy2f32v/+wkWWrl
	gFDDOvP3OjcgeSdt3xcYcMJUiGazZ+oBUn7KgntRZMViUyfgYVVB80OtDlwL1G/zaAvPjDC+5NK41
	CKKqVyveHdpvvGSVax1UFAFxKKfkgPYHUtYhR6q+5wy0TBvieR9Qr7hQyslOZTzCJQkSIprC3m8B9
	gIFiUJmkhU8zghQBF9kAgq0oEq7GB44UYpSOgH8pO4Wy7wCK+DkTX6lAOrIejUb4qd4cQo0+Zu87X
	BPV/MF7bxbMFvELsuTBEtB+33IZ5wfjiiqbLt57llIrKzXxWnx+hZ2Rc/7YgyXLsVQKIZsyrGAS9v
	IqrsKB6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZmS-0000000HIpc-0jMi;
	Tue, 30 Jun 2026 14:49:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZmO-0000000HIpH-3CYp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:49:43 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aeb17c2564so1928334e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 07:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782830978; cv=none;
        d=google.com; s=arc-20260327;
        b=pzbfZeJjRtME19XXqLoGmYXpzYhBol165igE9wQ54wHjRjg2w2WLczZC7Iw+UR/eUb
         HPIlg2xVfAOeqDhoZDBmuzixAkkUgB1hapGqRaDOKmsGnM/UQiM1GHgcmWxAmYGQPVz3
         Fsxv/+vIZsxu11AXb8egnjvz75cqm0eHCt4jHbDF9SontHmGKTGeOVARzNCUAd6j3qej
         mqTlLipwDwI0Nk8U1yAEK4nIj8Mtz0mHdftZQ+DFufEW3julIgPkE7aYvg0c0Odjlncu
         6KkcxvCSSEp5oQLbDWEqtMUIzH9RcDbJToYXz5tU0RE3WrbJj8ftuokSs9yOSyv8shTC
         9uOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        fh=Uf8LF13WdbzHVQ2uB5atgBuIob57VcqAGoUJf4Mfnq4=;
        b=OlwRkD9XqfdH/o/WBx7VHLgYyl7tBaGc3jcx7oBWE/EKnm9Cw5pRUCPXtsn6fA4Ng1
         3fjnoCXIhTJYZAl1uauFMTR5gMQuvt+FvIaNKaIQ840LEqw6d5C4kIQ5jQqNcU1aK+8E
         Cgn328rx7i8JLFxCy/XNhMSCjejpub/TBNTZIa4CFkLOgwghtQnzdon+jT6m086dpRJl
         ZXnh1r3HEbOxE+59wJX0RBeJAJyAJjpMAdU7er3oPJ4GEWNnAT4uqzAgsYogKVHmhVVU
         uJ2lZDtgrsk7esOZ2kIKGTS18PzyJ5Fz7hXDy0995gZg5QXfKmib3tZdYWnjEME0V6Ya
         HI2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782830978; x=1783435778; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=ggDvML0IgUUD4xb3QTjFLlUifvV+pm0nIOY3juZ2JLvCwXMla8aQnd8VvvbrCEiGZl
         7hzh4zW8j9C7e0FGmmSKGK/BQUxwBobPM3p7AeVltKDiq5ChlWJaBa61oXPKhmjMSsxC
         BPgGiLck/upfLbgPe1RlLaWNJFcr1oSOsAIhwmIaHsHzdy2wMhth/ofHO8RQSV5kxZiD
         aHm2UI/5k6ncWFax8BV8H3tjnSGDvKqRDEFxAnYbOV7cbl6KRkvHezUDjiN3QEG5UY5w
         T1W06zpDGPu6bQqvS74aHJKJWO1ylUOOvxAxsIJ2tUJQt7crHfbbRquhq0SsFZfkVy6q
         M6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830978; x=1783435778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAHFXtMiFS3SQCPXfcc6nAkzBIK1JQ7gQg2BRXU7Bfc=;
        b=iFs9ybHL8GJlE/u9IXXJLvQtItwuPXt8bz/5sBBGcr0dgE4afA37KJenRO2fXuRcjz
         c64BlFVmLhTHd7uhUeyEp1y52Rc3mumgTpDa2SDTYOOT/OVo0/OGI0YB4htKNbT5Wn2o
         LJansBDZFJ0D2AWfJ79KB2BrL672boLVMqWeKUcvc77L+UOxDduiNKh2f9Rkn4HDwEb+
         B3Fr+A5AsHzcQaTU4u8E0Hk9CHugrYcVxg24UiyCXHwBU4ikO2UpjvS6QsXP5L6nmNo6
         X12d4k5u80UY9tmxPlnflUVvBAhnxh6ScAfTZq7kX5pq6jKm46YF3SLCc2Ns2PmiAb+4
         HStA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7QgvTVBCgXLWooVToIHcDSlKDcCkuVvocLv3XkL5PQDRnM05YdalcxzJOhNuiqDFa4tRPtoF0PBHs3CqrieaB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk/zDOjMPzxEkRoMQFrczPDXWlS7+s6mLN14JF/Jv589sfHkZS
	EpIZ+aetD+ZtLlCUFO+OLPtO7f3raF64RhqusFfnuY01kTu63rPPBCg6qJ8JliEbomnlDi+fsPD
	sKigkN9OwOXSlUw4AXd8jbygAEg21M4U=
X-Gm-Gg: AfdE7clbd9HJz5ivtD8wbWaxCuSgwdhqviEWH8zojnGKSCoaOxK+yyli/HrfB49nLpe
	wOj1WOR3YZey7nD8UdeljE3eqbVuMhzbzd1Ih/eU0nXSZGHsam2E+PrBs8PTxuIxRVkYQIXbsJS
	NnK1T1a8+pduPcTn46RB2xkys6MTk1ialPZouHnrDreiwLeIZXzo2/yMxFNdg7dbnAS8pOZXb2u
	+E1YzApE7W0bisJ+6JZQuUZqjnf+wWI7TEg2j0T40uFq1UkPLEZPGgg5qG7DnlmAdeBvLsvDGHZ
	0RQfA5QGw8nA6KhOLtQa4+jdJE0zsOsQdRGzxlWtTJG8fSIPGldd8ZYTGEUy/dLoQVRF5HbVmgt
	VKiUHnhHRrexvcfceyOvN
X-Received: by 2002:a05:6512:640e:b0:5ae:b6cf:2869 with SMTP id
 2adb3069b0e04-5aebdb9485emr981524e87.23.1782830977995; Tue, 30 Jun 2026
 07:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <aj5KJEIsTl6IK0nX@gmail.com>
In-Reply-To: <aj5KJEIsTl6IK0nX@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 30 Jun 2026 22:49:00 +0800
X-Gm-Features: AVVi8CeNolHc0bWFWi94se6V_El3cArCALeJfgf0e7sVp8JXgJSa3XDzBUrtcNM
Message-ID: <CAL+tcoA6=_paEdqWaY7-VHdBeAxEFeMCfTECAEGv3C6ZqFUNSw@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] LPC 2026: System Monitoring and Observability Microconference
To: Breno Leitao <leitao@debian.org>
Cc: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	linux-mm@kvack.org, iipeace5@gmail.com, gavinguo@igalia.com, 
	linux@jordanrome.com, amscanne@meta.com, sj@kernel.org, gpiccoli@igalia.com, 
	Daniel Gomez <da.gomez@kernel.org>, mfo@igalia.com, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_074940_845290_9C2C3B49 
X-CRM114-Status: GOOD (  16.32  )
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

On Fri, Jun 26, 2026 at 5:56=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> We are pleased to announce the Call for Proposals (CFP) for another
> edition of  System Monitoring and Observability Microconference, this
> time at the 2026 Linux Plumbers Conference (LPC), taking place in
> Prague, Czechia, from Oct 5-7, 2026.
>
>   https://lpc.events/event/20/sessions/262/
>
> This microconference provides a valuable forum for key engineering areas
> such as:
>
>    - Kernel Health and Runtime Monitoring
>    - Hardware Integration and Error Detection
>    - Correlation of Issues (crashes, stalls, bugs)
>    - Virtualization Stack Monitoring
>    - Memory Management Monitoring and Observability
>    - Anomaly Detection Algorithms for System Behavior
>    - Automated Analysis, Remediation and post mortem analyzes
>
> The purpose of each talk is to share challenges and discuss potential
> improvements. Sessions will last 20 to 30 minutes and aim to encourage
> brainstorming and open dialogue about ongoing issues rather than
> delivering immediate solutions.
>
> The conference acts as both a knowledge-sharing platform and a strategic
> venue for guiding the future of kernel technologies to better meet the
> demands of large-scale infrastructure.
>
> We invite you to submit your proposals here:
>         https://lpc.events/event/20/abstracts/
>
> Please select track "Linux System Monitoring and Observability MC"

A kind reminder: at the bottom of the page [1], please click the
'Submit new abstract' button so that you will be able to quickly
submit a new proposal. (Admittedly, it's a bit easy to miss the entry
especially for the newcomers)

If you have any questions/suggestions/problems, please do not hesitate
to contact Breno or me.

Again, proposals are greatly appreciated :)

[1]: https://lpc.events/event/20/abstracts/

Thanks,
Jason


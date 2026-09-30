Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6848FCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=; b=g+lEQu5RLGHBcGG3xcIehpiRaf
	Hkg7DErDLaJ2DRWJZBRuryXLR2dWBh92Xm6i2x2f11IuwnuGpFae+AvjYgbZzE8sJidZHZJhF7fE5
	nAECHkgcY0o37KaVy+2cRcCL3+Zjj1K2GtFdOYNA/iOzgrMX8C3gKBpJDylBYVQOIjxvJNjTYbHFr
	qsFIEgt6tYQJhrXIE42O7L1r2IZ1dUguJL0+vSAHTr+tiYkh0/aCMAdxsr7njEYhuznlzgJTynNEg
	sc+Ym8bdJ8ANqjGjHRBNiiI7okYrfTO74aa0rqdm31K3A7joJNU3KFht1dEXJTDHgUsRim7duS47o
	O3rrrNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqbS-00000005Yhm-1qsT;
	Wed, 30 Sep 2026 09:27:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqbQ-00000005Yh2-3Cof
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 09:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=; b=qjXC1GSuHuxxzgSqOw5nm0BLiU
	Lskrw1krAA5IWUDjNEvbyGYdChfoa6U7ra+CS+QYL4rfByF0SsAWBUZnbJp6Lbn4pQlbKMsnqv3gl
	P/Os25aCJ6XszaBCrw4OGRV7K46S3mxa+u441puXrVg7GcapBYxIcdZyMPEWz+YoYSjifU9aLdY8P
	8+PaE1JTd7Z47IUOzxjQac+/KhJLTZtlxjfo8382YC9jXzLAgomJXaLc9yVb+Omnh1tKFUEpcODC9
	1gQ9Jm523Y1z5W/6OZyDy+WTqpBRVzuq9LhnDEjkIQJDjxr8UXuh9hj78U9sBE1MS3R1udyLgTHPz
	zKS6ABcw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBqbH-00000003Zx4-1jMt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:27:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dcxp2119418
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=; b=hxZcIdBnBZT671Aa
	Tn1fS6wYB5ZiDEO49xdsMfjoZpM+E7lzUVYEZtMxuFbKxuKgdNP6O8Qn5QIKjBsm
	wJCgzaG2/lFpvx9XDJrCtUe+qxbguo1S2b4CbRIKQDtVt79e0JShciJJwepw/1LY
	SzHPFthHkJIf/fOcCV8JEOcZW9y2+2RlTk5Ks1JmcQeEN2JQQA8yNbCIyEKWOQv1
	UUo/RsGo7TAejIXnwANrQ2EkUY+4nJ3YOhQP+mOfBj1wzMQT5pBXr3sQDDHresQd
	K/0Qy2c8Uf8vQBu3FOdkrtBniQeWTx12E63t7VTq2LOLXsypmtxyGBe+6P+MPfgB
	Ht21bw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhej0x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 09:27:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so5722982a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790760460; cv=none;
        d=google.com; s=arc-20260327;
        b=BpBDv3Xu/hszJ+smM8TRwZNEhMy7OiqVpNr1/1kbYSaDI5NLQKywsB33uMFPiBnS8D
         1Zcy+mizUpLCZ3G8dRyv/X4t5gr9U5MnNEYWvo8zAajMCY+jM41UTT4m6kSGdIbtaihU
         iy+up9kT26cHG8DhOgl1YetC6DfpFK/y5Cewt2prxSz6wAO9Kt+hM0MLM2CecX3DKkBE
         Lk4lTUpc8oKwSfL6VpwThUWLL6Z3GLKcaj/dxwNYbqEJmcE+Wd6bIu1ytTy/bjtzBdOz
         MrALsgsDX3b6e/qGTYWNgJEMLodA8VQF5zkKnl4WD/zkuHPyOU7DFjzK3ZwpsfuRZFoP
         LKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        fh=/6FCMyuGMSmFN3Hsk7tvYS4DDSk48VUNB6dqHMioXfE=;
        b=H+zJSA5akbb4jo4xMtNjKx1RoIwJsjkhf3jU/jDigVH0nKgNufK/6TAFSVr50vQmqW
         thchMJtiqOAb3v+EG7e/avXfVcZ+T8pJE2rE4rw7yJCI49x1IsL9cW1yYWAisPqrbfhK
         v9puLTKLHKS4r7MpuRsxiPMz0ocFamejcG0izaWxmMTAzi38w+vmSE8vt8uZhMKlRzNq
         95TE4i/Z0SDjtZG6UAdnmI4wQzLL5s7Ve072Q1I70C2xUQ42yJYwDv61idAfPFqmNMSr
         K6vubSy3ycgi3cwsx8tbkCr/XXDHuLWBJ0DOEFK4TAVGobpDZceFoKbdYtpOCRiIYEQO
         ZWxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790760460; x=1791365260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        b=CoHVt4NF0vMIFjBxJsdvGKI0BiibmAcZqV27H8mUDUDY+KTj9JyAHcLsKilHSD1ytP
         yTgUVK8RxhoHLLCm+6bkPrNtCucYvFq8dzgObyyG5OCV1tFHUlP2wZNyU71tC8Vtdbnm
         4gTV3d4RNrZHXPGvd1Z/gGoWLmlDI+a7NGRF9+Jn9B41Ts0WW/HM/r3OZXjgRkbhH/wz
         2qqHHcnVIY+GOiTkpcNQhOvntbvUFmpJKpyY0ysCe04DX1Rm3oXKBgVfQOPz/AqqQ7rR
         Hy+b10efuhzYlv91QJZki9SKwUHBtarIbA/7BdPXtvspFoZFrvQVE5Rjv8IZrElFNeGv
         SoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760460; x=1791365260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aas5dFpRUJyHYCp7dUKEi7p5PXcPa3N+KVeAt5vuJzo=;
        b=jpSCXuIVEt6yBZcS8XmtjRWwNIcxk7VACu5zVgPLpuG2NUSaNUjkJGfYrCtvUuOpEd
         654imh96YPH+vKPwEVjSqsJi0/J8S8QL+FV1gHv8EVzN5rpkI2Zc6a28iV3zHlEQLor7
         FQ1a47jXwD+d2kQKuiL1nRA6A0hEetruDQ3VN+b3N7tCKi7gxgIpMfL+TKh0+cJrPnbo
         Q2myOgtboKWXwXTDmoVDoWqHYkWUafWqPwvpCyqXqYwUE5PO46oROrUNmXbduiaoYnvq
         ul7za9yflerALi/L22IPDE/8NL8J7M8ADJKMF68M1WLO4/iu2yiDRJDmWAftfBeCArnj
         /1Ug==
X-Forwarded-Encrypted: i=1; AKwUvBym+NEG/CKkC3cvvefBC9irYXtDSlwXvIxiHIg9HcWCny9yP6U0kPven96u7Z8yZfLgyQ1jvFPqPoVy4W6b7Yun@lists.infradead.org
X-Gm-Message-State: AFq9FYKxRuNUqqq2sDvoFddBGXToZMLHlF2WTOkUY9T+dzG0vt08epOP
	fONPajI8DH9SfNmtjOtjMdsfzDzpmOlFmvWGkZedbRQSM8q9NJwu/4QiJpLrlxzIcoHvm05UjV8
	BEpzoUG261IbKbHqNF/G8Wn6H9Otlihch77mqoLNsAOIcDPkcnJPjx30ZKDrkqWhgyZF4RG99y9
	13uyeQhi67Sl4nDwRdGcz8a8ojLItpW3eDlmiyD8y4V+5XwTb/ZqZG
X-Gm-Gg: AYBFou1ObDEhKJ83Zsy4jW3qNPDXDkQkCBmCbKWHfalafAmTHyGoZ5bmS1yxwyx02kG
	KUHQTp8z59YwlCpOI9Ekr2WpH1kj1YQV6n7RzzWUOxHt+PXSrzOFJlbNxjd5ojmzjzM1TV5hNyN
	KBK9hkHEFN8bti1YYsqBLZk5TOBKf9ywGGpyWg+gQ2bnQ1uzKWjVpq2ZFe4w==
X-Received: by 2002:a17:90b:4e87:b0:3a4:b2f5:d01f with SMTP id 98e67ed59e1d1-3a4d1787217mr660503a91.40.1790760460240;
        Wed, 30 Sep 2026 02:27:40 -0700 (PDT)
X-Received: by 2002:a17:90b:4e87:b0:3a4:b2f5:d01f with SMTP id
 98e67ed59e1d1-3a4d1787217mr660485a91.40.1790760459446; Wed, 30 Sep 2026
 02:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260921191326.2146363-1-sanderson@brivo.com> <CAPx+jO8g-y+uc4YXUeZ3yOH6s44WFpytNu3-f6iLSjtHAVPd+A@mail.gmail.com>
 <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
In-Reply-To: <e5a5dccc-46c4-497c-ab8b-b3f7fe5e316d@brivo.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:27:27 +0200
X-Gm-Features: AclHuK-S1WmRfbn9a5BeauI3-UXbHdXkwq45V-fosa7Wt5Ing9N0Y4xLuBNhtzM
Message-ID: <CAPx+jO8QfkO42HnzU5BEQsGzqb6_pUFeT38E4EBpSA1kEpTexg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Convert host->lock to raw spinlock
To: Sean Anderson <sanderson@brivo.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-mmc@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Az9rPwROXxc8ig-593Ym10RIrTTVBpw3
X-Proofpoint-ORIG-GUID: Az9rPwROXxc8ig-593Ym10RIrTTVBpw3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfXxFuw4Lmsqf71
 sncjMSdQL6uu7Wq9bGVo/PNABA85s8gx8jYpU0l5zYkTLs/qFoHTjhOb/ETdkR6BhWsvib7if1d
 QY0vilOUWqlR/hoq2tVCbyL3USRXnvX+l1ynI8+qrgMt6bV1CxiDRcLATxjMXCusIW1TLW3xphe
 ZFzI9OTym9569MwjeVQ7VjZd/IBBgmYqsTvOPFI0rbrXswEVogZTYKrBspIG8jFAjlk0lml10H2
 pHmZy1oBgWIfgQUWJv+lcypjtYudHrBukMhQUTbFWMqzldJm2JEWlEXph5l72whnWP4NlOoMoy1
 72AOT0jJteUgbhIJbAqiNe0fH8xVHofUEqdqHyHGqqtB5pRIL4J4rNnIRb+VpBpuIw/XQlatkO+
 FjgLMnSDEne0AznYBzJwV+IJsCh88wRDCvnM+A/lFaX/5BObEQA45uWamwpcSUn2mFdNtQ8bJN4
 j4+ce+8YC6Nu+uyuzWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzNyBTYWx0ZWRfX7X0deDORr+x3
 zZ1jLHlo7XSBiR5P1/4LxO0uwRmeZ/75B6C0ue16WNsd7dDKcylEVTNTGfY4iDg+DdLdkInSumX
 EIBpaLijZrKqza2bQQgJFdLbYy6sFfM=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcd60d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=GX7wjADfAAAA:8
 a=LhH22EzeW9Yl2Fhwn_IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_102743_981718_13E9B4EE 
X-CRM114-Status: GOOD (  30.10  )
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

On Mon, Sep 28, 2026 at 6:22=E2=80=AFPM Sean Anderson <sanderson@brivo.com>=
 wrote:
>
>
>
> On 9/28/26 12:17 PM, Ulf Hansson wrote:
> > On Mon, Sep 21, 2026 at 9:14=E2=80=AFPM Sean Anderson <sanderson@brivo.=
com> wrote:
> >>
> >> The primary handler for IRQF_ONESHOT interrupts is always run without
> >> threading, even on PREEMPT_RT. Therefore, we must use a raw spinlock,
> >> which will never sleep (even on PREEMPT_RT).
> >
> > Sorry, but I don't quite understand the above. Are you saying that
> > IRQF_ONESHOT only works with raw spinlocks?
>
> The primary handler of an IRQF_ONESHOT handler must use raw spinlocks.
>
> https://www.kernel.org/doc/html/latest/core-api/real-time/differences.htm=
l#interrupt-handling

Right, thanks for sharing!

Rather than moving to use a raw spinlock, I think a better option
would be to convert the driver into using only a threaded irq handler,
unless there are specific reasons why this can't work.

>
> >
> >>
> >> Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
> >> Signed-off-by: Sean Anderson <sanderson@brivo.com>

Kind regards
Uffe


> >> ---
> >>
> >>   drivers/mmc/host/meson-gx-mmc.c | 12 ++++++------
> >>   1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-=
gx-mmc.c
> >> index 694bb443d5f3f..d5365c0404cb9 100644
> >> --- a/drivers/mmc/host/meson-gx-mmc.c
> >> +++ b/drivers/mmc/host/meson-gx-mmc.c
> >> @@ -176,7 +176,7 @@ struct meson_host {
> >>
> >>          bool needs_pre_post_req;
> >>
> >> -       spinlock_t lock;
> >> +       raw_spinlock_t lock;
> >>   };
> >>
> >>   #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
> >> @@ -953,10 +953,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *=
dev_id)
> >>          cmd =3D host->cmd;
> >>
> >>          if (status & IRQ_SDIO) {
> >> -               spin_lock(&host->lock);
> >> +               raw_spin_lock(&host->lock);
> >>                  __meson_mmc_enable_sdio_irq(host->mmc, 0);
> >>                  sdio_signal_irq(host->mmc);
> >> -               spin_unlock(&host->lock);
> >> +               raw_spin_unlock(&host->lock);
> >>                  status &=3D ~IRQ_SDIO;
> >>                  if (!status)
> >>                          return IRQ_HANDLED;
> >> @@ -1112,9 +1112,9 @@ static void meson_mmc_enable_sdio_irq(struct mmc=
_host *mmc, int enable)
> >>          struct meson_host *host =3D mmc_priv(mmc);
> >>          unsigned long flags;
> >>
> >> -       spin_lock_irqsave(&host->lock, flags);
> >> +       raw_spin_lock_irqsave(&host->lock, flags);
> >>          __meson_mmc_enable_sdio_irq(mmc, enable);
> >> -       spin_unlock_irqrestore(&host->lock, flags);
> >> +       raw_spin_unlock_irqrestore(&host->lock, flags);
> >>   }
> >>
> >>   static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
> >> @@ -1225,7 +1225,7 @@ static int meson_mmc_probe(struct platform_devic=
e *pdev)
> >>          if (ret)
> >>                  goto err_init_clk;
> >>
> >> -       spin_lock_init(&host->lock);
> >> +       raw_spin_lock_init(&host->lock);
> >>
> >>          if (host->dram_access_quirk) {
> >>                  /* Limit segments to 1 due to low available sram memo=
ry */
> >> ---
> >> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> >> branch: meson_mmc_raw
> >>
> >> --
> >> 2.53.0
> >>
>


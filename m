Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E869C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 03:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=; b=JFWNP/pb8+6JdMJTl7tsy6oY74
	QZjT0UVAMXL8Kos/32lNV2bhrvW50GF3mG8qbeI32QfZMGey3T9n7NoHGSFlWPcaNa4y2+mZqNEHm
	giBBjyZN+UloC+DOnBE+WSNjUfOkRkJt3Wxn4M/mKWT28f22/xlcNszoGrmQt38J6o1C22uPZ9u8l
	PrES7TaOV3qBUIzaNc1HNi9r11w+1qrqmT0KOz8OhThLrJaVqJAy74HtlbUSg46SvE/xPaIUzIkNE
	73Q8JC4DnGC9zonP2gPBWDQzF6tcLrmIb1vIVJDMDM6BbUYdEeBhfzjkTdgW1mh4aMCfY3PpVCda/
	uwvD2EgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcyjF-00000006GGL-1Pk2;
	Wed, 29 Jan 2025 03:27:01 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcyhu-00000006GDH-3B7R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 03:25:40 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso51971575ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jan 2025 19:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121137; x=1738725937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
        b=na/1h4wgvveAKn0EMNMcv3TjipdxEuQF71Jag2BtNq+C/yHH+B084xQ/t5aCtPFqiW
         Tmsf2RGb+LZuicRhpl6OWuWIwOrZrEQ/xu+o0MsNx3WwmePOnj4kDKizEm3zuD88qU6N
         JKKm3CbpiCvLoWJ+/No8TZjacwba4q/l8AgW2Un2eSkIYiqnt91FQLxTy9pZDVsfkbvo
         cIXZMU+o6OI5mYh90YMZaur03OWB4o+mRL4kGo2w9rFtenaqnEZcucBSDa7CKlk1Uaas
         5zyK5nz/+cJ1KM0ymFv6cI4PYtqxFi5lzKzefAwXJvqs/RdP2a80w+1jGjBfohuGFM2H
         5n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121137; x=1738725937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
        b=rlmMEIspZ4DkHbQIhSybGEtkVENw6nCq0r9DCT0OksE+upSDzj3I8/ocoqBOsuIhx8
         ch0USjlhN7RM/vXZOwCDV5s4Xxl8hohWeToCaaAQfre/FhFWYMDMu65vUCkiW/7OFz5G
         OPZaBa0iB5XWrA2gO5BcNrP8WNAr1FWx0y9GdLv6qwtlRRAjSz5WroQ5Hr85m4Mt/+u3
         f98AgWUa0XEVZO8nIaAubQBaoG1//301AjnKRApQ4CLWqHJ4hoAR9kyNnWcATWlqEmSr
         7evMUkuVS1hGqpvQXK9zgL3+eDb3/JAD5NOa/Q1NNQJ5eEPPtNBGpghmhSqlhoS8Dml6
         gIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfy3p45xudthcZUVfqgvmkW0avSD9paAIhfkSKBTlup4BS7FSHCH7jCsbvRDwjpskgWLgWnv1zutQAa9SyFsPl@lists.infradead.org
X-Gm-Message-State: AOJu0YwqVpqe79YGEBJUAdAAsiRHaJ/RUk448RI2W25f/wzGved/HPDW
	56Mwrmfw3fi7o6vW+eF+3jkcU0vD7vnBHaCwC/4e3tYbJ9Zpvo+18vGJbRvHuI0SsVNUJnJgVAJ
	lfh8YHLQkakrNv4U0LjNqmz1V9T8=
X-Gm-Gg: ASbGncvs1L/sHT3Cb6jqWXFbtJ4mrP49TtUcI8OBiUB3Qr07EEtkx70nGj4eSoULt/z
	UGhr/NMewOH25eGI4bm2JE2V3QknNTwJWoy75ERrgE9b60LyoofttpjetWcmVCbQWpjSziqAbuw
	==
X-Google-Smtp-Source: AGHT+IGpMyCuuvxRf9JKn/IGg4EgOQrCoMhpqUUmXymP6ydEXopJZ7pGxrRwB8qnqi6LFxZVbq4bt2PZZlGgSUMT9/8=
X-Received: by 2002:a05:6e02:138c:b0:3cf:ba60:e2fd with SMTP id
 e9e14a558f8ab-3cffe3e5d81mr18188015ab.12.1738121137443; Tue, 28 Jan 2025
 19:25:37 -0800 (PST)
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com> <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
In-Reply-To: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 19:25:25 -0800
X-Gm-Features: AWEUYZkXMQul2iCS8g_lBAK6cifDDx4C71uDvFmo8QxPAIsqMGize_ZuktCSrPU
Message-ID: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_192538_820524_DC8AF79D 
X-CRM114-Status: GOOD (  35.68  )
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

On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote=
:
> > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic=
_guptap@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott w=
rote:
> > > > > > > > > The context would remain stalled till we write to CBn_RES=
UME. Which is done
> > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled c=
ontext further
> > > > > > > > > transactions are not processed and we shouldn't see furth=
er faults and
> > > > > > > > > or fault inerrupts. Do you observe faults with stalled co=
ntext?
> > > > > > > >
> > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before th=
e interrupt
> > > > > > > > has been cleared doesn't clear SS. This happened with v2 in=
 the case
> > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > qcom_adreno_smmu_resume_translation() immediately from its =
fault
> > > > > > > > handler, and we'd get a storm of unhandled interrupts until=
 it was
> > > > > > > > disabled. Given that the architecture spec says we're suppo=
sed to
> > > > > > > > clear the interrupt first this may have been an attempt to =
"help"
> > > > > > > > developers.
> > > > > > > >
> > > > > > >
> > > > > > > Just to clarify, present sequence is:
> > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > 2. Report fault to client
> > > > > > > 3. resume/terminate stalled transaction
> > > > > > > 4. clear FSR
> > > > > > >
> > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence,=
 is FSR.SS
> > > > > > > cleared and interrupt storm is observed.
> > > > > >
> > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseque=
nt
> > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 ther=
e is no
> > > > > > interrupt storm. From this we conclude that MMU-500 does not cl=
ear
> > > > > > FSR.SS unless #4 happens before #3.
> > > > > >
> > > > > Thanks Connor for clarification. I get your point now. I think it=
's
> > > > > expected interrupt storm with #2->#3->#4 sequence is expected.  W=
ith
> > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seq=
uence of
> > > > > #1->#2->#4->#3, which is spec recommended.
> > > > >
> > > > > so, common fault handler can be modified to follow the same seque=
nce, but I
> > > > > have concern regarding clearing FSR before reporting fault to cli=
ent.
> > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other =
client
> > > > > handler may have similar expecation of fault register not changed=
 before
> > > > > client fault handler is called.
> > > >
> > > > Simple solution would be to move the clearing of FSR to after the
> > > > fault is reported.  It doesn't really matter if it is before or aft=
er,
> > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > drm/msm will collect the fault info from the irq handler.
> > >
> > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FS=
R
> > > and #3 is writing RESUME. So no, unfortunately it does actually matte=
r
> > > and we get a storm of unhandled IRQs if we don't clear FSR first. You=
r
> > > solution is what v2 did and it didn't work.
> >
> > So, just clear FSR also in the resume path
>
> Then we'd run the risk of incorrectly accepting a second fault if it
> happens immediately after we resume. Not terrible for our use-case
> where we only really need the first fault to be accurate and we
> disable stall-on-fault afterwards, but if you ever leave it on then it
> would result in another interrupt storm.
>

Howso? We'd still be ensuring that #4 happens before #3?  If needed we
can add a param to resume_translation() so drm can tell it to only
clear FSR if it calls resume_translation from the interrupt handler,
or something like that.  But I don't want to lose capturing the FSR,
and I don't think we need to.

BR,
-R


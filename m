Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F37FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 18:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kbJ8+C/uu2ODDuwjMpH5SsAXpV8tPujfUT5kEiVUq8=; b=jCFi8GaCwq7Y5DS/x7teQpza2Q
	l/eHpfZA8i//iT9UC40uXIlUwbRgma+F9vLFkmTbs8zK1UuFp6c2dohputPxXRXX/1lzkkTweeONo
	uPHd3xrRCSBSiI+gCPw9AkFsNXRmQpSUIzzB3Cm6ZRkBR1y/cvLdKEtGE4ZWoWNM3MSl7Gz+npRtq
	OA3t7YamRF2FqVXXZ3Le6ngwqCld6A3cJz/EW2sUXAcmnbMP/fiEw+kOnZF4tVr20vYaAs6e7A2F6
	lDMoMeR8AsahWFXojcaiL2CYVl+oJDoDYvSyPnQeisgZ1Ov/YYo2i9NA4zELHcHm2iShKLAQy+36c
	YAy2Qd5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAulD-00000002jx1-0e5I;
	Fri, 02 May 2025 18:05:19 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAujF-00000002jjE-3HPN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 18:03:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2240aad70f2so16415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746208996; x=1746813796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kbJ8+C/uu2ODDuwjMpH5SsAXpV8tPujfUT5kEiVUq8=;
        b=LuQhhCq16GDK8RUpgRju1+jDGX2EcLelN33x3nDkFZkPIDsJTrcz4uabATKd3VypAI
         aVdMatt/z3soFfxOetnKyW7/nuH+5vbkXO2OEiLKkoHbaLGFqU42Bx7huH8yicJaEmQi
         hm8qLY7VD5b/3KsSHugttsTDqVpuq4jO3BPCDZS/idzKSZWhmrl3VLoGfotFgWoB05Y1
         Rumk78ukvnbXe48ETule5U9uUaoKDBCWQep0wpdvriUMxw65axsh9mW3Ico304Tk3OhF
         yB75/qN5zvJFiJswUEUNcDd/dle416bzul0+sy620p6ix9uDfO+rGfncU29r0qRfFVEg
         xcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746208996; x=1746813796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kbJ8+C/uu2ODDuwjMpH5SsAXpV8tPujfUT5kEiVUq8=;
        b=e8qlHAeMCYLGydbOlEx1l2l00qrTJ6H4Gtl8hmaqgRdkEqc/Y5AY4RpkpiuW8H2cm5
         M/8OAg627RHvEScjjh6CC+J/uxZZmCo8gy2a7FXJK7avNLdWn1gvGOTobydPnzSp//3i
         eUBkeMyYGz7eGNgOr8cQxAusQ5HJ0OXoSKz/crjkFrawa6qfeZkE4urGXhMlrBHnqIge
         4FkVkUuhcD4Jk47Qh/9zG96N/4Hzpq/z+J/0O4NTLuFa5lBgr1+UhA4du8jzY1qeYfvP
         6AffdfFtx0bUbfWpxpqc3IyYILpwVWgXjWKLfShfXhUTAyRGwpXKsPElBoBU1Ug/Z8Nr
         WFSw==
X-Forwarded-Encrypted: i=1; AJvYcCWERXzg2JZJRovLiE5cBgSz94dxJ4g6+mfBP/iBvkguWyDbCdwNi5B/TSnODyh55T5/r9YqCf3ky++VFm0Zpe7B@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5C8Kuu67fqueWxly+jLnNWae8O78X3CLPvFwLzfHUdB2Mrshu
	8TQzlN5vAkJQynWQnse6ybeR3lgIXyFtfREk29/sboKvd4GeC6aZGJhimVhvKYQnzkBWJwBFfU5
	DKBKXD4saCHs1f91c4VZ0G3XQDrdyhqdxzEfA
X-Gm-Gg: ASbGnct9e/mvHad042FhYwJUtSfxVm2IpWbsvCarEtT/1oDy6D89SEEgkoESWZ9NGoG
	/DNWk/7mMH/dV1llIREdj4CCaoMwfFoxFy/YoIP9JX4c0qqGLYtUB6TyDqvw8AANl/GaUtIMce4
	3K/gd23yTx69L1DiIy6Hm+sIyReklFxsggYnHEz7yPoVyecQI+JBIu
X-Google-Smtp-Source: AGHT+IGif0Eh2+5YkpX39b2tNiXHYnZt3gkMnS36U3DbQWNXHb+22416g9jDeQvpOmxKSTiTERO1uErucZK65/w9jk4=
X-Received: by 2002:a17:902:db0b:b0:21f:631c:7fc9 with SMTP id
 d9443c01a7336-22e189c0121mr194485ad.0.1746208995602; Fri, 02 May 2025
 11:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250410080723.953525-1-yeoreum.yun@arm.com> <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com> <aBUC5fsSVzGkQtUV@arm.com>
In-Reply-To: <aBUC5fsSVzGkQtUV@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 2 May 2025 11:03:02 -0700
X-Gm-Features: ATxdqUGj_ouubcbGaHwTQTp7_F0tDIVnLUEUzyS1JU_L9W_1IMMJiAzk-HvEemk
Message-ID: <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand <david@redhat.com>, Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, 
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com, 
	maz@kernel.org, oliver.upton@linux.dev, frederic@kernel.org, 
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io, 
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com, 
	mark.rutland@arm.com, samuel.holland@sifive.com, palmer@rivosinc.com, 
	charlie@rivosinc.com, thiago.bauermann@linaro.org, bgray@linux.ibm.com, 
	tglx@linutronix.de, puranjay@kernel.org, yang@os.amperecomputing.com, 
	mbenes@suse.cz, joel.granados@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_110317_820760_D646422A 
X-CRM114-Status: GOOD (  23.66  )
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

On Fri, May 2, 2025 at 10:37=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Thu, Apr 24, 2025 at 10:34:57PM +0200, David Hildenbrand wrote:
> > On 10.04.25 10:07, Yeoreum Yun wrote:
> > > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> > > opeartion only.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > ---
> > >   include/uapi/linux/prctl.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > > index 15c18ef4eb11..83ac566251d8 100644
> > > --- a/include/uapi/linux/prctl.h
> > > +++ b/include/uapi/linux/prctl.h
> > > @@ -244,6 +244,8 @@ struct prctl_mm_map {
> > >   # define PR_MTE_TAG_MASK          (0xffffUL << PR_MTE_TAG_SHIFT)
> > >   /* Unused; kept only for source compatibility */
> > >   # define PR_MTE_TCF_SHIFT         1
> > > +/* MTE tag check store only */
> > > +# define PR_MTE_STORE_ONLY         (1UL << 19)
> >
> > That is the next available bit after PR_MTE_TAG_MASK, correct?
> >
> > Would we want to leave some space to grow PR_MTE_TAG_MASK in the future
> > (could that happen?)?
>
> The current mask covers 16 tags (bits 59:56 of a pointer) and given the
> reluctance to have a tag storage of 4 bits per 16 bytes (3% of RAM), I
> doubt we'd ever grow this.
>
> However, you have a good point, we could indeed leave 32 bits for the
> tag mask, just in case MTE gets so much traction that someone wants 8
> bits per tag (and likely a bigger granule than 16 bytes). It doesn't
> cost us anything to add additional bits from (PR_MTE_TAG_SHIFT + 32).

If it's 8 bits per tag wouldn't the exclusion mask need to be 256
bits? I probably wouldn't try to anticipate this case since it would
likely require a different API anyway.

Peter


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E068D637DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62+SRIZ98WwwWs2kgA6doBGmZ5Cs8CyuW9dLlAZbi6s=; b=07LHjBpgy+LM1tgx1epBtd+ZjF
	mt7QyE6n470X6fHjR1N8J3GX8GE6gHHAq2e1T0XKyJgrgtYance2WPi5frST2gh9hh6o0x/jluqTP
	dzX6myY4RV00Qn5VyAkowvrR1y7SFQi1Z/Mg6zbtmdyFc2Qxb4M/8SPgHqkAGkQntaFyKxc3M7guf
	FwETocndB7otJIuibHbAVDB2eiLKbqrvqmeBYveqfEdAcbTpDAM1Yaaks4iiMIjpQy8QLJ3ftbs59
	iQaqnvj/mXMaKfPkso1ZGAsJgeAAiH4msbz/vnanKIo2HyA35C/zGytXMI5QXR0Kr5EMY5W9E2NBT
	TTsIF99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdrx-00000005url-2F4L;
	Tue, 16 Dec 2025 22:50:13 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdrv-00000005uqt-15Pt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:50:12 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4f34f257a1bso145541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 14:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765925409; cv=none;
        d=google.com; s=arc-20240605;
        b=beCpPXRYNFNfMkWfodhjB4BmmRwPrdIK9YAripPAeh76A6RuB55HfMV6ES8OubmCJR
         NLl5XBqSFZRut9880Pr6fj05fHjDn61e3aOrRLdp+5VcR/w7M7rQYANmmM34HBpLCPBl
         eLeDU+7OX3XUSW9YTTpJ5G9LJ/VednCSjEA0/HbiWfSrnVhzdi131dM1GLMxYXKDRE3F
         2x7Gy4rD6yYuxpr57TcjGmCIm9nPwhxIF49umsfrPxVjF6ARUttqiHiS0y+RAS7JEQ2D
         EkqhAlVfvvnJNZBud95Nzxg0cT5iBriztt5CyFMCqJ164lrNTx4kG3Skk+wtcAT39pMz
         q2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=62+SRIZ98WwwWs2kgA6doBGmZ5Cs8CyuW9dLlAZbi6s=;
        fh=RXBVnCVNB1RAiWVIdhj4v7uceedgRwj8rdIDYMBrMZo=;
        b=NPHNjHOjP7bSuEiGcjPTk7HYTI6Lek7RHFL7YIBhsCbY7u9qMRORu1mOHmmbEhtEmc
         5wLZidRv+J4mjWtT1/bJzvDOqXmDpwB9/PQlydqEgm9HC2HcPJMOgpj9ZM/XdjpbIXlr
         BqwKNtLU2PChsoqtT8oexx3mM3Dn/pj/OCrfKPShQFG6ZmkUzv5WXiX9i/wgT73vjZou
         JHz73BkrDFR/JBsVe+Bndjiqk0gvBYfFV3wTjCALMXWBulPRt1hiww+yy/iMzMfBYg3R
         6AOOPO4GBMmiQLS1+K/CSfFWTO62g/1ydycQw2M7Cesa9RC9iT8LmymTusB6q6JkaMk4
         zkIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765925409; x=1766530209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62+SRIZ98WwwWs2kgA6doBGmZ5Cs8CyuW9dLlAZbi6s=;
        b=2g7hrQwkqgzD9WOIIwl8JkdhQIM4igO5PHl46YffPDt+sGVhQ+jBKzlCL0e6qT1DeC
         R1m3DHMc2V1Xq2nADIJMGw841aJL7UkzlbC6j/WkrByhYU5aUKGjY56mLsN6Iq+aB/7c
         xLKTytx5S6XsSFzrnjBr8RrhG1ocPH9bhJmkNga5dMcQYTzOfj00RKDYmO8BjCKb5/4n
         wOq2B/JW1pkC4t71DSEGdSz8DYu/My8KqHduDobRcXRNxa6QBkGKHp/6g5/Bu5O4VSa0
         SGpfPXE8BoWatibh9rVsxiA/jPzGEpVIu600LiJGg2B1BDsQDEzn3iqgmqysOppXD9hW
         /csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925409; x=1766530209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62+SRIZ98WwwWs2kgA6doBGmZ5Cs8CyuW9dLlAZbi6s=;
        b=jCQ0rytxrH4cbfd/V7JAQHibe7gNyr21OCh4DXB+ZeMJSmEf13X0YKs3DzL2I6tjT/
         vMF6JYNWlyv5O20Cl4vlL/J3xFyG9Oiu2kMuxfztxZ05kfI//fx0QYFIZ6iFzIsNai1t
         /nouH6yWZEdllyA3J3r3KcC2xX/Xg5ZYxJU3VogcbmeyTHAxvkmRBSi98f8vldv2ctPx
         t7hSc2ZX92s99mlF9QkjSMAZPVly5HfLX1Iw9mCZBKgfnVkpdRRuvsVokstExjHsMpv+
         JMXp08iAJ81/EEDq/NuZ7U1BfjweYKVohGQkdzMfsg5ILP23FLqB/JAfbgcL3g/2QG+9
         7Dnw==
X-Forwarded-Encrypted: i=1; AJvYcCUp22yzvyCt/q/iekdcMYxi1/o7JQwsUk5twuRDKhnK3y93JMAjETSdQvH2PKOkbt9/4itFR9Xs+ueorVFBseSe@lists.infradead.org
X-Gm-Message-State: AOJu0YyhnHO/r3g9gYx2MtGUwc0Dk+PZveMhh/PP2q1QmF9iZphznCIu
	koyp2yvFezyaIcB2p/v9pTtIju/Xr+CNEuuQs/1ju2cmrUy+gJb3UHxD6ltavUnCMYdiR6Tn8nA
	4s5wDGnVpvGR/Q63N06jCZKU/M8pbjdf7U111bVQi
X-Gm-Gg: AY/fxX4K0VX8099CpYmx6wfxudR1DdyVVEi9qjrrJXCSmPIGYoDxdQ3ERnDXqHIob4l
	U6P9jlQMDQbQVFlC6GVgwCjIGy5Tm5U6eBrDXreuOq7+cYgcRGcRLRh4kIV+5GUid5W50gdN1A1
	8mvJB/ElL6lzZmlCdejeGo51JuT0epZNprvIxBpq+SJsJltjXZuEK7R9q4ummMULdKNZITigD2M
	dJj3o1lUxBjuPNei5rwotAC4dC6kBOhlJEdIRKj15reHl2SDzYt5P7IGFgmp97cvS8Zunw2rV4G
	DT6/WV5tmLJlRDeJHie+Y9evINNNDA==
X-Google-Smtp-Source: AGHT+IHRovgVdEdoTpfJBQNPndiAvLg4h0XYlICvrVg++0Z98jb8QPhOp+hOCQlqL17fWZvobnxYO4M8LzufWJx4ZGI=
X-Received: by 2002:ac8:5808:0:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-4f3546d6609mr1208081cf.19.1765925409187; Tue, 16 Dec 2025
 14:50:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1765334526.git.nicolinc@nvidia.com> <cc0d4ab571e2e789ee1cddfa035379dc54f0601b.1765334526.git.nicolinc@nvidia.com>
 <aT87A1ur4htPjM5T@google.com> <aUB0t4MSf624Wwmw@Asurada-Nvidia>
In-Reply-To: <aUB0t4MSf624Wwmw@Asurada-Nvidia>
From: Mostafa Saleh <smostafa@google.com>
Date: Tue, 16 Dec 2025 22:49:58 +0000
X-Gm-Features: AQt7F2oAVNd4BF3J14ZyQBuIyHCibuWRhpjMatdY8mcWa6Ix5db5Jg_y5HhSJH8
Message-ID: <CAFgf54pDfBhx8j0M0JJfJR8kDwqOyPem7W1E8kpmBur5q2pjxQ@mail.gmail.com>
Subject: Re: [PATCH rc v3 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com, praan@google.com, 
	xueshuai@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_145011_313207_6A3FC99E 
X-CRM114-Status: GOOD (  31.16  )
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

On Mon, Dec 15, 2025 at 8:51=E2=80=AFPM Nicolin Chen <nicolinc@nvidia.com> =
wrote:
>
> Hi Mostafa,
>
> On Sun, Dec 14, 2025 at 10:32:35PM +0000, Mostafa Saleh wrote:
> > On Tue, Dec 09, 2025 at 06:45:16PM -0800, Nicolin Chen wrote:
> > > @@ -1207,12 +1223,9 @@ void arm_smmu_write_entry(struct arm_smmu_entr=
y_writer *writer, __le64 *entry,
> > >             entry_set(writer, entry, target, 0, 1);
> > >     } else {
> > >             /*
> > > -            * No inuse bit changed. Sanity check that all unused bit=
s are 0
> > > -            * in the entry. The target was already sanity checked by
> > > -            * compute_qword_diff().
> > > +            * No inuse bit changed, though ignored bits may have cha=
nged.
> > >              */
> > > -           WARN_ON_ONCE(
> > > -                   entry_set(writer, entry, target, 0, NUM_ENTRY_QWO=
RDS));
> > > +           entry_set(writer, entry, target, 0, NUM_ENTRY_QWORDS);
> >
> > After this change, no other caller uses the entry_set() return value, s=
o it
> > can be changed to return void.
>
> OK.
>
> > >     }
> > >  }
> > >  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_write_entry);
> > > @@ -1543,6 +1556,7 @@ static void arm_smmu_ste_writer_sync_entry(stru=
ct arm_smmu_entry_writer *writer)
> > >  static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_op=
s =3D {
> > >     .sync =3D arm_smmu_ste_writer_sync_entry,
> > >     .get_used =3D arm_smmu_get_ste_used,
> > > +   .get_ignored =3D arm_smmu_get_ste_ignored,
> > >  };
> > >
> >
> > I have some mixed feelings about this, having get_used(), then get_igno=
red()
> > with the same bits set seems confusing to me, specially the get_ignored=
()
> > loops back to update cur_used, which is set from get_used()
> >
> > My initial though was just to remove this bit from get_used() + some ch=
anges
> > to checks setting bits that are not used would be enough, and the seman=
tics
> > of get_used() can be something as:
> > =E2=80=9CReturn bits used by the updated translation regime that MUST b=
e observed
> > atomically=E2=80=9D and in that case we can ignore things as MEV as it =
doesn=E2=80=99t
> > impact the translation.
> >
> > However, this approach makes it a bit explicit which bits are ignored, =
if we
> > keep this logic, I think changing the name of get_ignored() might help,=
 to
> > something as "get_allowed_break()" or "get_update_safe()"?
>
> I think "ignored" itself is brief and understandable.. Instead,
> perhaps we can add a kdocs to make it clearer:
>
> /**
>  * struct arm_smmu_entry_writer_ops - STE/CD entry writer operations
>  * @get_used: Output to @used the bits used by the hardware corresponding=
 to the
>  *            configurations bits set in a given @entry
>  * @get_ignored: Output to @ignored the bits that are listed in the "used=
" list
>  *               but allowed to be ignored by arm_smmu_entry_qword_diff()=
. Each
>  *               field (bits) must provide a reason to justify that the e=
ntries
>  *               can be updated safely without breaking STE/CD configurat=
ions.
>  * @sync: Operation to synchronize the updated STE/CD entries in the memo=
ry
>  */
> struct arm_smmu_entry_writer_ops {
>         void (*get_used)(const __le64 *entry, __le64 *used);
>         void (*get_ignored)(__le64 *ignored);
>         void (*sync)(struct arm_smmu_entry_writer *writer);
> };
>
> ?
>

A comment is indeed helpful, but my point was that "used" and
"ignored" make it seem that they are mutually exclusive.

Thanks,
Mostafa

> Thanks
> Nicolin


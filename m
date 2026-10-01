Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC6CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=; b=2yfRtgcUJW+T3Aai+ePMfiupP/
	f0D+YUMDZIhGWeC/+oQPSutB+MK/KvOXh4lPP1Hu+P88mLV4YoWqwKtXh1WAJzYLBan/JfBVApaqI
	HBjq0IVAeq/CRxNO4fU8s7c3OWzmnA56hH5LzBTvGAjwnjwWifxvbYAgcCC+nz6NlRLvjZGGHtwyQ
	owuWBYWYrT4p97V5ogDbVshS3bAG8GOZVg3kS+3LQYkRSZ8+73zTXn6aBdKibyW4NnWSHacuDojk/
	q6Vm2PjXzeYYUWZ63rVI8ecRK91c0tkDgHErkCA9Eh183xJOl4mP2hyj2IICX/3JOicpEqZVBakh7
	Pwhfxc8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNyo-0000000ACZI-0VxR;
	Thu, 01 Oct 2026 21:06:14 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCNyk-0000000ACXu-2fuV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 21:06:12 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8633a38df87so3047621b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888767; cv=none;
        d=google.com; s=arc-20260327;
        b=M0xoeQTFKMMCHrv1rfp3AdZOcjZq6qXd8f7t+2pPgVwjkiHUnnjYBvzb3iEsmZLx92
         kKkEno+Jk3jsU3/4wjNzp0JTM7dbDaRiDJ93sF7X5sgV6E8BzdiIQZoaEF/Ar+mwEAmI
         WQWCdyERzasxnepTLF93p0dT0Upa33os5uAjSKgLf3vTMW9SlTWGNorHSGKEXF1+Pcx2
         ZJgX0uWnwO0nS3CqoYPI6+kVNuzFGRG8LS/FnxKHW34onnN3hJWboxTn/uEWUw1ZuzEU
         J8HGkCjrsO4JtYcO9UUZNXbDFmq/Ll4DuboUI3gpKTSQ1XtZdThE6xDbZ08EC/ZHMtml
         +jIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        fh=VXNZmtO7gBOvpCUjV/TSR0jyOzjfzJLEZAYkyLbY/PQ=;
        b=GnzWrR0L5KWs6pmdBu6d92cv3qKuLewPOKgxmbErb0WWtbidoF8BLzYrIjgh3hvdbN
         DrIlm9NYHcyAA9H5NmLk6T2JT56OYQnp7WgL0M/KnNgaiQ0wH6WsFmQhuO/j+HW5h35J
         BD7miYoG9YeYmQzpRljZVa368UL1tKnpXvhN+JoqymNDFPKF50hSgaOaXTg2kXCVuhm5
         kKMlxTLdnYEz5+rFkOvYFu7ErvGOLBDEldd1EyrUecUpgh5u2HBSiwSp27U2lHuxc9rd
         AYyl+fm9726VjpqVjZ4wSJqdSjn7OJV8E39nj1Xh/Nl+0Dm3gOZwTwDqxwuMcOyBxYUx
         7w0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790888767; x=1791493567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=DN/VIJm/TVF33kWwQQj8JT3e4luI0EuPjE6obgYGddC8GUaWXvnLl0Af6mkX86sDhS
         sSVcpoHXrF0CkHCNh/XL04L3PoTDInpKTuj9/niTRjVlZo0qSVLynAd0Jo6AJIFIPvS2
         +BYTfjfdyjDd5FVRmCwTVvYsUT0/FEDxZh+EQIj2l1LXjEmLoU+QyTPqs1FY5ZHrlT+o
         xWYIo8/5+r1qQMI/lr+nLSi0aeztrvufqRJQwO7W5vJluz/mAnh197hH0nO7qbJDV72W
         odjOXXjcYwtJfmLfLLZAaMa2QzwHxGgqpTGpJ9Z2zAn94D+QqFd2ghoErT5GzNT2Ucvg
         AIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888767; x=1791493567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=Vbt/CCYP1nIpM3tnCsVjm3ylnGkMrErDuZTjo8BxeGQlJx713hazwBxM78OJIl22bs
         Bz3Eg6hr/htFe6tcs4QWYCcOaQm9X06My4Eoj5mIR8GXzU/jKSm6hoNzWOysbRvo3c44
         pcKkv5wAm6XuNGfOpPdXDXX/5D4dU/GALPv3IdIKRq1e16gvfje9AblmM6RER3lw1FYw
         A2sHRfdtugAGV0X22mQp4rrm5h+M4Ahl7/GSejkFPFp5a/8ukkD+x1kfCdYqtWpfPDgn
         f4sJZ/FktFrIjIex/M9dt97GA+gHCv+Cx+uLMvZKxA5421dKBI/R1XiVBa3l7F0DHkBV
         FtCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqXuoTiphlmGb3dm1R7m6TxvWRCdeK7vorWQFcaMhA/Fr6t5a74D9+tLS0upvpnID/OxHLEKD41cERPVyvcZIl@lists.infradead.org
X-Gm-Message-State: AFuF++mnEfAFIBZquWdhB3QZOmVgLrF7Pm+rlaAxJuWsxRCVrGaw55rB
	E0g3y0BYMZys4KRn0U/DGK11jyPKbrcTphrucYt/xubURdnmuegqFTHvCn7UJOfUaGGTsZbSsgo
	MD0XA5VFWcBuGaBFQ9/ZfF28BtAV+DRK2eBoWuxHw
X-Gm-Gg: AYBFou3MCYnjR/dxxvbeS3cRX4wIJ+SJg7+PL3o+eHRzU2fi2Qf3eCqg8Bx2Q8pW5K6
	OkOJRruAs3DpByyhm2REuIKBcaTDq0sqqhA1MoIo2UFUcE9M0Yai6mShlqMEdjRSNtBcBJcxADR
	uJp7qqgKceTZenUVTMcLSy3e77pWP74eYGeD5KRFvqVZbu8Yzhugo5Zie89g2RizWIugstVjst+
	/5AexD508HDgNoIoUKIzjqTMto2jA5A56va+oBmIpdoArSYr9FSCBH17V6nfibq+qBy0EwEAMOK
	h21Vb1YawjCF8ZSV+WvMTuutm4B4+kZK2U1u2mKnvSulDHWE6uaDFYB0U2uNTWHGFks64ibytg+
	JjkzIkTlOFFTB
X-Received: by 2002:a05:6a00:1254:b0:881:5dcb:400e with SMTP id
 d2e1a72fcca58-88af6d24f34mr727169b3a.56.1790888767004; Thu, 01 Oct 2026
 14:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2026 17:05:54 -0400
X-Gm-Features: AclHuK923qNeclwyxHc-N96rTW9f--kU_8IWc_3FVDcJfFTXqnWMr4asd_Mjppw
Message-ID: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_140610_817988_869346A4 
X-CRM114-Status: GOOD (  23.07  )
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

On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
>
> The SYSCALL record currently logs only four of the six syscall
> arguments (a0-a3), silently discarding the remaining two. This
> leads to the need for auxiliary records when audit-relevant
> data lands in the 5th or 6th argument of a syscall.
>
> This series extends the SYSCALL record to log all six arguments,
> by adding arguments a4 and a5 inline within the existing record.

Thanks Ricardo, this looks great!

There are a few things in some of the individual patches which I reply
to in a minute, but there are a couple of "global" things that I
wanted to mention:

* As pointed out by Sashiko, when you were converting all of the
arches, it looks like you missed alpha.  I took a quick look and it
appears that it should be a pretty straightforward conversion like
most of the others.

* We need to get ACKs from all the various arch maintainers.  Aside
from the parisc changes all of your arch specific patches are trivial
(and cleaner than the existing code IMO) so I don't expect anyone to
complain, but getting ACKs will likely take some time.  Even the
parisc patches aren't that bad, and arguably they fix a problem for
seccomp so that should make asking for ACKs easier :)

Since I expect chasing down all the various maintainers for ACKs will
take a little while, and I'd like to start getting this patchset some
basic testing, I'm going to merge it into dev-staging now.  While the
dev-staging branch doesn't feed into linux-next (this isn't likely to
land in the next merge window) it is one of the branches that gets
tested automatically and included in my kernel-secnext RPM builds.
This also means you won't need to worry about keeping this patchset
up-to-date with rebasing, as I rebase dev-staging as needed (it
intentionally isn't a stable branch).  Going forward, if there are any
minor changes to this patchset, e.g. a few line change in one of two
patches, please just send a fixup patchset based against
audit/dev-staging and I'll squash it into the relevant patch in the
series.  However, in the unlikely event that a major rewrite is
needed, just send a new patchset ... but I'll be very surprised if
that happens here :)

--=20
paul-moore.com


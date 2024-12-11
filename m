Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F79DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/i8dNvXTaun9z8Q9pOEyBWkakhPhjAhJI5wRL2G2nQ=; b=jOnNtdn3KTPWKSFxg4iVPSpSGQ
	1Qf4pxIHEyn7jtrcK4SzxUevGqmn833mzg1YyEIGfEavpNaHEEAuwfjxSkash6Vr9CzYNxqYocmoJ
	DQBl6K6MctKh0HGubdVN7FGy+Yh0NC4L6gsQQpsBHFwrp9vlpQdNwZfBJONPWxqzWJisLxA6qm6c9
	Upbe8dd8mEhkvvdWpEbEGlkFXUHZ45TZFHZ2Ti8JeM+dhWTNxDH4T9fXBV+WRskRPVpxqIJ9VLMma
	rw0NuMhQckbZIWFTf2LQc1d9PQVmxb3pOxgouxtBIjq3/bnQukFsu2v2Tur309yTmhlu/JsUjH6Ls
	igWZ+j4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJwV-0000000EZnx-3L2g;
	Wed, 11 Dec 2024 10:27:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJqw-0000000EYtb-44xM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:22:00 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so8639506a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733912517; x=1734517317; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/i8dNvXTaun9z8Q9pOEyBWkakhPhjAhJI5wRL2G2nQ=;
        b=OGyGHcPEw6uN3SbWY3KuXnoXrbmh0gAvgIVmcj+a3f4sdVgQIHxdLV+awoZiUPvCsQ
         /e/QpswijADTKSWMhDcBcWNX99F2t4jbfCEGHs3LAMzVwvMi2dtzcna5RhzNcQpIbDJV
         zUIBfeEklaes2GyQUl8t6iKgbg1QNG1ofcpi+BqyiqJyO7DpOh2/OzTpOpPrPTQFkjVu
         NzIoqJWIyqaI4ZuHtndZeiwP/aW70/IlZVBKLIUqPBYAZK1fkwLQfBCZHP/+YIwh/2EW
         5lwfCNbCE/c+AdMk3aawmhomFkJIjmGjKpIjs4xai9hEbmgmm5oZnSMPs0fU6/tQzcdw
         PUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912517; x=1734517317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/i8dNvXTaun9z8Q9pOEyBWkakhPhjAhJI5wRL2G2nQ=;
        b=XLC+R/uq+pYAiOsGF1ttEvoxgTNb4rLcEdievTihhj1ZJMVMLSeFs8/tu4fOzysbjv
         nVGXCswLh8GbQ90pWE9g2F4qLAZpGqptry0XdiJ1ytp/hIE9UrY0Te7MrYQVhFzQGpHA
         rxz2CBDTfBOZvG1XaboIu7kBlRQrPEJceMmKsTIM/lZwTLf1wAW6m9Pzhhez5MdRNAGk
         e/8guWumBkvp2EKO4cd10JlWkx4ODcboheB3a4fRBSLGselrXSNe/gWI5W/s08gxdNry
         Ow7SaPzQ+j004im+6ALtwjzsYCkEo8pNiPwEuEE1mXq9ArWZSWLAk8NKMPZc60Ibtkkn
         1TTw==
X-Forwarded-Encrypted: i=1; AJvYcCXBjPAIiUqyTIO0Z0aeuqJgBtcBGrpcjm02OYQjLpKU9rKJW0YN/bQN8WMo+GUN/+46mcc1PXwSUrbbgjcO0qrk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqb6fwGReRl++JRrdbL7OxRB2w9YzYDWAb3ys1ev6atTmK74nW
	ySnO+bVIiYYNXZp1ERh0A/rxVxIuKc/65gnUtraLn8L1zpuZvV1DJ0jz3QVnTA==
X-Gm-Gg: ASbGnctS0/S2alk61PCb0SlnE18ATZ7nAXMx0mo5MjjokdA3wZ2SAwrTpX930ZTEZSL
	/EWl6s83gsGANB3AUTSZnrYRzEAEzB/vAvSdpuk0JrNlcbDzjJsBBdBN1DSp5uWIRvPf9g0ENpa
	cCJOZQU9/bIO4yEPmDTF748Y20rreZPVglBCNywZWU1y1oAlssObTIHWVX+SUtxC2hrE082L+L3
	yZt2hjECyr+/Inmqk1RshUK8oq8tJXywvK+zpEysqJTbCRcCRK0IA2sjbvzj3rbJ7quAIb9QqBF
	G82dIw34zTe6
X-Google-Smtp-Source: AGHT+IELT5UzTgOIXuU7LZ69/dEjIwcPQX35BOSNVLAIcwuMifyoSthPeY6StXkxja6PnQSGI29ikg==
X-Received: by 2002:a05:6402:3806:b0:5d2:7396:b0ca with SMTP id 4fb4d7f45d1cf-5d4330a5108mr2074782a12.12.1733912516917;
        Wed, 11 Dec 2024 02:21:56 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d871f1c8sm6587655a12.13.2024.12.11.02.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:21:56 -0800 (PST)
Date: Wed, 11 Dec 2024 10:21:53 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] KVM: arm64: Introduce __pkvm_host_share_guest()
Message-ID: <Z1lnwZPrx9GzgFCG@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-11-qperret@google.com>
 <CA+EHjTwHSyQ1FJc7axbLNuBxSWpRVE6brb34nO+F59=QRmfQEg@mail.gmail.com>
 <Z1hhHRdpCZcLs046@google.com>
 <CA+EHjTw4GX3j_ssN-tWnf780xkvyKO5mBN6fnvXeWvQcBDmcNg@mail.gmail.com>
 <Z1liL3BtoPnSyvlh@google.com>
 <CA+EHjTw+3oAcp3ujjPmbcu42=95nw8WA=rZHYFL91ZK_Wfs_vA@mail.gmail.com>
 <Z1lmG-3KnOZrOCCa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1lmG-3KnOZrOCCa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_022159_008405_1D6A206E 
X-CRM114-Status: GOOD (  43.81  )
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

On Wednesday 11 Dec 2024 at 10:14:51 (+0000), Quentin Perret wrote:
> On Wednesday 11 Dec 2024 at 10:07:16 (+0000), Fuad Tabba wrote:
> > On Wed, 11 Dec 2024 at 09:58, Quentin Perret <qperret@google.com> wrote:
> > >
> > > On Tuesday 10 Dec 2024 at 15:51:01 (+0000), Fuad Tabba wrote:
> > > > On Tue, 10 Dec 2024 at 15:41, Quentin Perret <qperret@google.com> wrote:
> > > > > > Initially I thought the comment was related to the warning below,
> > > > > > which confused me.
> > > > >
> > > > > It actually is about the warning below :-)
> > > > >
> > > > > > Now I think what you're trying to say is that we'll
> > > > > > allow the share, and the (unrelated to the comment) warning is to
> > > > > > ensure that the PKVM_PAGE_SHARED_OWNED is consistent with the share
> > > > > > count.
> > > > >
> > > > > So, the only case where the host should ever attempt do use
> > > > > __pkvm_host_share_guest() on a page that is already shared is for a page
> > > > > already shared *with an np-guest*. The page->host_share_guest_count being
> > > > > elevated is the easiest way to check that the page is indeed in that
> > > > > state, hence the warning.
> > > > >
> > > > > If for example the host was trying to share with an np-guest a page that
> > > > > is currently shared with the hypervisor, that check would fail. We can
> > > > > discuss whether or not we would want to allow it, but for now there is
> > > > > strictly no need for it so I went with the restrictive option. We can
> > > > > relax that constraint later if need be.
> > > > >
> > > > > > I think what you should have here, which would work better with the
> > > > > > comment, is something like:
> > > > > >
> > > > > >                 /* Only host to np-guest multi-sharing is tolerated */
> > > > > > +               if (pkvm_hyp_vcpu_is_protected(vcpu))
> > > > > > +                       return -EPERM;
> > > > > >
> > > > > > That would even make the comment unnecessary.
> > > > >
> > > > > I would prefer not adding this here, handle___pkvm_host_share_guest() in
> > > > > hyp-main.c already does that for us.
> > > >
> > > > I understand now, and I agree that an additional check isn't
> > > > necessary. Could you clarify the comment though? It's the word "only"
> > > > that threw me off, since to me it implied that the check was enforcing
> > > > the word "only". Maybe:
> > > >
> > > > >                 /* Tolerate host to np-guest multi-sharing. */
> > >
> > > I guess 'only' is somewhat important, it is the _only_ type of
> > > multi-sharing that we allow and the check enforces precisely that. The
> > > WARN_ON() will be triggered for any other type of multi-sharing, so we
> > > are really checking that _only_ np-guest multi-sharing goes through.
> > >
> > > Perhaps the confusing part is that the code as-is relies on WARN_ON()
> > > being fatal for the enforcement. Would it help if I changed the 'break'
> > > statement right after to 'fallthrough' so we proceed to return -EPERM?
> > > In practice we won't return anything as the hypervisor will panic, but
> > > I presume it is better from a logic perspective.
> > 
> > It would, but then we wouldn't be tolerating np-guest multisharing,
> > but like you said, it's not like we're tolerating it now anyway.
> > 
> > I wonder if it would be better simply not to allow multisharing at all for now.
> 
> That would mean turning off MMU notifiers in the host and taking
> long-term GUP pins on np-guest pages I think. Multi-sharing can be
> caused by many things, KSM, the zero page ... so we we'd need to turn
> all of that off (IOW, no MMU notifiers).
> 
> That's more or less the status quo in Android, but I vote for not going
> down that path upstream. pKVM should ideally be transparent for np-guest
> support if at all possible.

And to clarify my suggestion above, we should fallthrough IFF
host_share_guest_count is 0, but break otherwise to retain multi-sharing
support. So it's not a simple s/break/fallthrough change, that needs a
tiny bit of added logic.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236D8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=; b=rUxhpWEPz0OyZJV3v5LgNCxlVN
	DeIHwa1lMUh9/yF4gOEqYbXA7laCTiQJfK7fJX7ovrYP3LuX07rJ4N+fWg2hjBQRRzlCsaOryJepG
	enhoHTaQknHPL7kR2X/oLz8xP/k/60aq06cBw9nnTp1Azne5Yjb4nsQaXlPpyl9AtGG4RMP7HlNUN
	kFvcaZqj9+IUw7SBgtmi+7TMDktFulg6wGXGlBPN++tM4OgM7vNX3N5HV56vA1fz2vxcwu+B6DzHP
	1QmI6nX+yrSwsQWF+MxT7T3esWuTAwAtan5Jh1XeB6IwWxV259XA/wQMs2asi1m8otH8fPtdKslY5
	N/GNGwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTex-0000000HZW0-3WEw;
	Fri, 06 Jun 2025 09:46:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNTWw-0000000HY6M-0QUY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 09:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749202708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
	b=VvLN8/HleQFf26tq5FdoZ9e9UUcMwnnAtC9wsIxcDav/z+S0OdQZdAdu4+deZng2/5JblC
	gVS20j3lIGtLwqlJHegiH+0LuIjYJDXfd9hmlmbMGuK16SD5f4u44/VfO9Mii3NdfNIerB
	v+dgVTPwpQggq5DrPT4P5hpIOprDl9c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-c597VfVTMbC6-ims6R_gSg-1; Fri, 06 Jun 2025 05:38:24 -0400
X-MC-Unique: c597VfVTMbC6-ims6R_gSg-1
X-Mimecast-MFC-AGG-ID: c597VfVTMbC6-ims6R_gSg_1749202703
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4ee113461so764207f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 02:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202703; x=1749807503;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26Ry3YWNg+Xx3lprVa5lk9OAapvgIQNkgZHWX4BPEr0=;
        b=UcUtDOc1aHS4rJxpvHBOyjV0Gmc04lrgjcDHHV2nrDszC+ih8dKPqZpcaGKYFNT9m7
         aHBFSVABVHqVefpAkMtzRxUSC98Oj+jKg7FEFt4VpnklGSrTP/GKop9BYE6dpD/fh6SK
         77hqtCekaOR+FG/b1ajrM7WdI/rrFqYdGR8bVtbJYAjYVVOOeucNmE1e5k8NPBEm9Fk4
         CRclqAb5G+xoAMF/bEGLz2qXCMvyJs9qJ7I3n6slFTmKx8QYtB25oxIYGBWLPJHk9irv
         xt05beZKGxoeFdH6tizvP036UgogjelL+9Y95cibRdZdIqoEyIBs+t2EGH6KoQMnpQHq
         0t7w==
X-Forwarded-Encrypted: i=1; AJvYcCUwl7KHVpTM9eJjx8fdEblOPWIVCV0n4pIL6R2Q/8oZnk5crAXrGzePvnD0dFGMXJFiUOr/saUCGdl2JopU89qw@lists.infradead.org
X-Gm-Message-State: AOJu0YxeEFNzFcNCNk2nSWLIuFXTxP1YxnzFVP6A4E6kEY2x20Ov+W97
	5P4MVOz89jFaYqQK9aQjGA4Qan78bFdK0L4dCPKdqdUEleztyz+i+ULQIa+SCQeJpbrBh1+2loU
	7nwzi8Hz4RFl1BDJgMWYyNHbv7osopnD+ZLrFttiT/k6p/kbiTDQHMy0Nv4F/4jej3+m5DfeGkz
	8J
X-Gm-Gg: ASbGncu4WlNtees9P6qODyvMNvwVkae1wqMb+g0BZ3dV0ehJSKqVT1rn55kHVbObMu9
	290KpZDOcY100+awtCPDR95KhjKU+VivaNFEwdM07BWiBZomGlO61VOgcnejKO0uQ5TVA/wBSsY
	2AOqXOURi/jI0rPY/abF+npPK8LMjjsEGwB4iHAmcX5SJSpkSZrXUZOIgFAhHzFPfuUnhb7J56m
	j/4bAt+CK+n64mJoHGZdaMqSklHridQ0ncvNC0FI0OWXrm5fjCGxpBA8lfcQ6OAebRIa54u75l9
	f6G/bJPMbxMbEZnAEhCDWl7aCE/RlBbIrLKFTWpZ2nYBmz13lsW2EEMEu4XnjrDARfa4aUySZI6
	kuQq1
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442152f8f.13.1749202703121;
        Fri, 06 Jun 2025 02:38:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2hgVVQ9Gk7GHogece0bM9/ZswNLeykZTGpNB8vcSGMUSbHrTwRCq1omPf2ID9eCFShi5YvA==
X-Received: by 2002:a05:6000:240b:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a531caa070mr2442120f8f.13.1749202702694;
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056122sm15416265e9.6.2025.06.06.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:38:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas
 Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: remove code clutter
In-Reply-To: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
References: <20250606090802.597504-1-lukas.bulwahn@redhat.com>
Date: Fri, 06 Jun 2025 11:38:19 +0200
Message-ID: <8734cddxbo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IzAd0MP1uE7zkD6xo_vXWZQtSFCfau-ucurDxTrEvXw_1749202703
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_023830_212657_F7517472 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> There is no need to introduce the boolean power_on to select the constant
> value for state. Simply pass the value for state as argument. Just remove
> this code clutter.
>
> No functional change.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat



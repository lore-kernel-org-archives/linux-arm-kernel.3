Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA1FCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=; b=dd0Jz1VoJYh85sFZdV7iXZx3YD
	vP4QAd0u+neWXhoi80cZcHuE8X8nbhZLq9mwczGm+8v/CyuSnpOEq7EECvNwjH87hV3iq6EAc5Dhb
	L3ro4yWhr9eMc9KVOelr6NYG3JRs3VSi/PMlBEXtiHppoOO1L29YZAOS5gZPe3qs5MNrHU4upLKBE
	mhUcoxEH81gm3xyvTKTFizdKy6gyntcJrMsw8KUhNT7LRYT7VQ930SYODNEbwf4DHrEKc86APICge
	TRNFT7CqeUIU0F6vfJNhEHcv59cKm6d/EL7Q70AdU+bNJCHzJvVTkKS746ylqp1OeY2wkAm57IOeO
	weV/8UIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERxw-00000002YKO-3cL0;
	Wed, 07 Oct 2026 13:45:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERxr-00000002YJb-0uNk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 13:45:49 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so8728e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 06:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791380745; cv=none;
        d=google.com; s=arc-20260327;
        b=JpJk5e9cT1nhQw31CXyrCk+y/oM86bD9ajgSluS6VylNK+aWBTYnu37dxQ2E29QP35
         B6vU76lf+QBALQXR5BonhCv8ODfGpBHdzzGf95gXHRFU3EwoVEK3Q7nYg+M43oZVIZnC
         p1jGEl65REJTDiK2BLDE/V8GKnzVMNkMWROuH6DZEchCO0add9lcmRBpn6J/9JY+6NX8
         +/5g2v+vDHkNUl+x1W48UiQQENd09DvmUttqgJDSgsXCAcLCr9gCZwEb+3jtDrqga5/F
         FY9GdKA8c0BVbdL8ymhLoJC7oAnWYZ/oL+BJ/CoUd1douQ/uI8uMHhS3/vLzaGlHdnTI
         5HkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        fh=OT6rjTpsRDzTjHWAtF9m39Kd6oGBGk0m4wb/pJKvfGE=;
        b=oHdSCBHHwwc5rg74O4IJWF13h76KNgAAYWha9pRXQKMg617h7W+ela1ZNWlpRy8CWf
         06i/kPoHXqDlgH9cOdJdXgZODyHidMwOsTkvVx3veTu9wm5hUvwMVew2ddaq+VaBF/wj
         Zh3Yr8kSsArvxMRg+PVK+VPtgZl9pnpHxmuto1zBVCpNiTnAfJQZMCr9p4QnznxD9YKC
         st79/b6IFN0FPJqBW7SQ3KueGCSWoC6j2DaKLirP4flW8iqhHHXflNqRXZB/xhjXcNrV
         3CTtqt0+CKsrsaU9f6FSGvpp6Mn7UJjxAwqxZNRUuO0Zr6EtLrRLuq9RB0Jp9u8Z2Bcr
         xy5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791380745; x=1791985545; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=K2PvVTalZuPRXRPoaGh3Ml2O8LSY4yemNXkS4MWU6yIsofQgNY87WxunG6o0x7kX6E
         Hi72pxuSrPHEWlgcI8echETfKouOtR+NSLNQfL8/itdlzSK5+4kzEODSlhOjDDJ1qjTU
         S3sxG/anINLa3vrTkiMZJsxTr4X/12eKu3CJZIM/XuAb+rIO23W75A101eKX9EdGsYXE
         kBDFWhSqFy5915GJ6L/XHUIWbxTQej9dTrGxVqsVyZH+tEcatOiNFlwntTf3D1uXrHKK
         WDC1p1T0LAqyiGX0LYnn7a3NsKDQ4DjQz0K+CWWTZ2FgwRLFAh3surc9H8iuZypYjE37
         bJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380745; x=1791985545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7R3ym81WdAEtexE6jWnwa4vea2N/jeqsSvQGrEvEZOo=;
        b=Fb50PBK+5NMtOMNmTZcOkRIBGFddLl2t2oKPESF5lUYGfEdnFLY4TDeCcJ2+gansUw
         zRdzGNIZG6ysluWdG/9eFA3bzvBtT14kxWuHX4UHqqqmSfkBSL53Oi0Rd00Fzeapz+9l
         EFmYnIRfi0Ks9GiWSLmLSsTqWuMTXcGwK2RzeMuXH0lBtpkLA+Vayn7/IagK2nw0Ht8q
         EMB/RfHWRoyQ5qPUqB+zdSVLzW+uOgzOnoJdDzO9DJmuOEx01h0wK97PklhVgWXpirrN
         GyL70Aq38pBJr17U+pxb1gzC3i/dQt1cGIFAirTr8h+CiPqLJ/Z+o0wuiXc1m1hx1TRN
         Uy+w==
X-Forwarded-Encrypted: i=1; AKwUvByxWoUb+qvD6BJa/0k7crqz8G/DL1reJSMT0yx2w421ZxM+OHgA86LfkfXymzrYYJWQAGR1OT2HMLs/V5y7WNiG@lists.infradead.org
X-Gm-Message-State: AFq9FYIos2BBiFzk1EhQD2KnZNxDcgTh0tLHbsQ7TfHz33Y+YdxCRnfu
	IzeZV8GamJNNp3sUmNmUS/Aq9rBbmvvTobGAinYsHxyGqvHlYLGEnY9UrOr2bc+kM4z91OsCAjr
	JdNjzy2OktncGYr42pXhjkmwG/TRYStINEUDRgTEC
X-Gm-Gg: AYBFou3Zwd6zmPIYby70zTjJtO9tZ2TBjIFenTr5zyNyRKEZzWFVDFvrngqk84K2xg5
	aweqNtcetGSMkaUB1YlOk5MJVc5onSZwUZeZ0YMsRnpDDYhqi7EixkICAaGB6VX3QWvz9CkQte8
	gEv5QQKSXczT+4s9NCpPVmEK6dd7AX2BDgOQM4q5SJubugurweo7uwvmhhG3CTSH9QhMx6Z3Sjw
	hRERhYnkoJC6PNtG9E3QHxBmdVRoug1+0feIX2939TBol1HmoCNsP6zPSjzaLvWNWumKrmeA/GT
	9VRWwHLJvedRtYCseAQ8kV4d5RykO13Q9jRfyKB4SAOuC4N4yu7CqH0n
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr320554e87.14.1791380744549; Wed, 07 Oct 2026
 06:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-13-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-13-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 15:45:07 +0200
X-Gm-Features: AclHuK9NBZeYXTKdDsAbHTEgR4p43Lr3P06clWDgtHoGILzFBEkx0SOT-Ggr9gA
Message-ID: <CA+EHjTxuAh1zegQGA0-dNAjDBnXUc036WhoGxoUvVmMW1BxdXg@mail.gmail.com>
Subject: Re: [PATCH v23 12/14] KVM: arm64: Abstract out memory abort handling
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_064547_751778_EBBA742F 
X-CRM114-Status: UNSURE (   7.58  )
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

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Move the memory abort handling under VM specific s2 operation.
>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


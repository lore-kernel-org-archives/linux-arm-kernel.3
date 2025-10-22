Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA88CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgC3n0OZ1bnLi7NXIKoKa5wMxZUzOLDPYVTIZbfJmj4=; b=E3xgU9Gntbj+E1hOurTF/rLTD9
	6Rh5otCt3WVCXkkYDys4BcVK7B3zw8472X9sUPR7mUdesPFSUpCUPrNhZBZRR3cUPR2SwizOW7Jnv
	A0tYaNoZbup1mhqdPxFaSIVdeEO730mXJDC0duHNA5r/zBy1dZxjF7F3TDgZyV3VEOpeFKEHOXW8Z
	YIBxsLaaLCeU0clJqgaw2xk3j9YWNAN3GdzdaoA0bQHYoZuWnJtk8Fq6UavrDZMlywemA4Lm9NL8E
	FiaiIQDN+mvReevMFx2rk4htJ6efYYbcVvXa+7RFjnTLDadPlNLUc1TxMRjY10ypd0VSWxQisyBHe
	MTAWLjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXyT-00000002nik-1Wq7;
	Wed, 22 Oct 2025 12:29:53 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXyQ-00000002ngx-0UQL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:29:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33bb1701ca5so5904187a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761136189; x=1761740989; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgC3n0OZ1bnLi7NXIKoKa5wMxZUzOLDPYVTIZbfJmj4=;
        b=lONEyhTk4jGh33XLknirjLVtdG8ETh3IXrY283tqIhC8W1dw8d9fXfQb/aEKj+TMMA
         j8RbvnwjG/m8iEH/4ilDi2KCgGFdqArZAm7zHjhjBY38YX31vaZToGUbyAMzP87RgjCA
         z6cBzsCYOCaQXx/PYowEzOwaRC18L0EZfH9EyTLxdeCs14HoDMLu/KS7z7C9yDh6oCu9
         fxSS1+fBO8pLBuAnxrioSkwrjkt0qoEYaqinfu632UZIkKepLNwETQVTSEFDg6QJbvCQ
         ohxJB+8eewATgTDQyWGmHAPeGQIiaBa7vowWz40CWfIen0qgkpGL0CURd6rNR3mTufZb
         bU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136189; x=1761740989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgC3n0OZ1bnLi7NXIKoKa5wMxZUzOLDPYVTIZbfJmj4=;
        b=pEllGoHYfrRW1In6/IYuCzl3wigxnY7JExPZG1zbPo6d0VsE70bWSIK3LviOPPeuU5
         WY3f8ZTepSrjF9Ne5O7bpGnPxellWYuRTWsX+TYk1gqLJwEunxcGrOrH6x8IMvBlqnog
         7LTyJvdq1BE1wn6GgVVrBzSw+69bT1394/dTatpmD478XxXwXN20LYknBQZkMkw/GVOl
         538fv1nCG4LJkNU+GFgCUrVT6+aV3qirVLme2UPvWXwYEzShNHvV8klxRTb7Q2q1zmWZ
         i0E+ADJq7z7c/LHg5f195LQQoFXatRM7rol1Xm/L+S8PG9hm+lRueNaIpn4FCcvgeRlO
         vAjg==
X-Forwarded-Encrypted: i=1; AJvYcCUatpFpVaHKkgbbAbe2nIo4v0GjUcKSIRnxX252eD9VJkcY+g95hujyHfPziuaWcCgViaUsl1JaOUp2BUhfmEOY@lists.infradead.org
X-Gm-Message-State: AOJu0YxTSfmLB5r9X+v9uosNdbYkGG+hnFbrd+gbvw4pLs8tA7QxxCIv
	6Nzxo07FV8TZDB+X4GtKVrMcXodgCbjRawDKeBW8fex0mZWPlTtccAgB+au5XDYy+bnrZTscUgc
	vUIZ2RvZhPaIGz6e4e5QNDcxV8r0OneE=
X-Gm-Gg: ASbGnctnPOWPIn4dUJ/tqFhTLjF0IuJXYZc/Vpzf81k9NGsrGpnWwimWXf6gnLU6WEg
	3rGwBi8dzgpYCJvDIL7wNimJm9G70NzS+UK8K3z94jOScbpyIs/NtfcLSUqqCw3ZBBWVrdNXTKH
	2JHzDmTn8gYZVoaXS/DS1NE4rDmpfulnkF25ddlA6f4yoQ+yN28HV9KN/D5dEbdRGH0/W3IuGRc
	zl7cKLtk8gu3z0C9hOIpbu0Hez/TsM/QN5UafmccI5HzaUkntnXieshX8uY
X-Google-Smtp-Source: AGHT+IFk5lUB3XklutyN+j9IdIuo6/klqXs33Xtsaz01xAhHZvg8eDzK6DGwTKzo99rOs65RxDj4T2Swtuqtu02nU9M=
X-Received: by 2002:a17:90a:e7d0:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-33bcf9146e9mr23394414a91.36.1761136189075; Wed, 22 Oct 2025
 05:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251022072729.14820-1-xion.wang@mediatek.com> <CAFqZXNuPqwfqA23LH8NOG6KM1Nb7WvW77wnpp-vZ5omU40j_qQ@mail.gmail.com>
In-Reply-To: <CAFqZXNuPqwfqA23LH8NOG6KM1Nb7WvW77wnpp-vZ5omU40j_qQ@mail.gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 22 Oct 2025 08:29:38 -0400
X-Gm-Features: AS18NWDSicEYx03TrEtOYVQuMO2BdGJlpNak_oI6vlqZpLBKSoJCcwBSCBuNhu8
Message-ID: <CAEjxPJ5BWjvDmQ37PPLHrmcTwRnOy6eW_uNoKG=ERZqRMAc3dw@mail.gmail.com>
Subject: Re: [PATCH 0/1] selinux: export current_sid API for use in other
 kernel modules
To: Ondrej Mosnacek <omosnace@redhat.com>
Cc: xion.wang@mediatek.com, Paul Moore <paul@paul-moore.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	huadian.liu@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_052950_156508_0132B2F0 
X-CRM114-Status: GOOD (  32.31  )
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

On Wed, Oct 22, 2025 at 4:08=E2=80=AFAM Ondrej Mosnacek <omosnace@redhat.co=
m> wrote:
>
> On Wed, Oct 22, 2025 at 9:43=E2=80=AFAM <xion.wang@mediatek.com> wrote:
> >
> > From: Xion Wang <xion.wang@mediatek.com>
> >
> > We have a kernel driver designed to monitor the status of the Android
> > userspace watchdog. The implementation works as follows: we modify the
> > Android userspace watchdog code to periodically send a "kick" signal to
> > the kernel driver via ioctl, so that the kernel driver can determine
> > whether the userspace is still responsive. If the kernel driver does no=
t
> > receive a kick signal from the userspace watchdog within a certain
> > period, it infers that the userspace is stuck. In this case, the kernel
> > driver will dump key process information at the kernel level and trigge=
r
> > a full system reboot.
> >
> > To ensure that only the legitimate Android userspace watchdog process c=
an
> > access the ioctl interface and perform the kick operation, and to preve=
nt
> > malicious or unauthorized processes from spoofing the kick action (whic=
h
> > could compromise system reliability), we want to identify the calling
> > task by its security identifier (sid). By checking the sid, we can
> > effectively prevent unauthorized processes from sending kick signals.
> >
> > Currently, the current_sid() function in the kernel is defined as
> > static inline and cannot be directly called from modules or drivers. We
> > propose to export this function, so that the kernel driver can call
> > current_sid() to obtain the sid of the current process and decide wheth=
er
> > to allow the kick operation.
> >
> > This change will help enhance system security and robustness by
> > preventing the watchdog mechanism from being bypassed or abused.
> >
> > I would like to ask the maintainers if there are any additional securit=
y
> > concerns regarding exporting current_sid() as a public API, or if there
> > are any alternative or more recommended approaches to achieve this goal=
.
> > Any feedback or suggestions would be greatly appreciated.
>
> Couldn't you just use security_cred_getsecid() or the new
> security_cred_getlsmprop()?
>
> Untested:
>
> u32 sid;
> security_cred_getsecid(current_cred(), &sid);
>
> -- or --
>
> lsm_prop prop;
> security_cred_getlsmprop(current_cred(), &prop);
> u32 sid =3D prop.selinux->secid;
>

I suppose the next logical question would be what will you do with the
secid - you can't just compare it to a fixed value since they are
dynamically assigned.
Normally you would instead just pass it to a SELinux permission check
to see if that SID is allowed the permission required to perform this
operation.
But this too would require using a LSM hook to perform the permission
check (in which case you don't need to fetch the SID separately; it
can all be done within the same hook).


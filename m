Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C9CCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 15:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=; b=GlEPulfwM/zwaOdoIKQa1Se5wj
	7xJrMsSSgLDMsXnAR1ekk0Mpw68HT3t+xzQTnJ51UgOU18WRWAfWZ6ubQZH5dSayo9L5fCSbvTVb2
	fqI0fjI0jweLh1ASjxx/d2Q/0V1IwkUGHkN/AR2V2qNz3bqTGsb3FeUN0JFIUJqQXBy+HQzUnDAXy
	K36uKT9ef1CAewmDkED3+Xzq0LqM52imyl99g82g5r6+bFwOeB1r+/3srFrDYMcw+xL34h4AQE/NJ
	+4IEkhrwU2lahW72YSWZlx8wzBiUjcJ78/dzjj2gArL+AZYg5a9vtDfP7kX6aQ9+MxxGMhAkHLkZB
	wC3vQMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdh8-0000000Cxw5-0qGv;
	Sun, 17 May 2026 15:46:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdh5-0000000CxvJ-2Rbv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 15:46:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so1164708f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 08:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032776; cv=none;
        d=google.com; s=arc-20240605;
        b=VkV8tEVfPqah1FfNljdL+ASWPiAm7aY/UeYfnDdOUDyL7o8uRa7yDJk++PKBQBAigE
         NiozN69g66Rageomtk1xvhw8DgFjC9Dc5bZ8tVnBf5GkD9Gtt3OHADSYsQIRcLtchtcW
         6jeHG0gdDVwF1EMt7buAYGXPmjOdM2o93LSjyIp3axgO3u8waLJZuVQ6rk6kLgScyzms
         0Hd4c+it6tW8mQYy9mKXF2xdyzvcpSRBGdOGz2q14dlFlvSVfHUzfvUbJ6kNEoYwoQap
         Tq2w1LGYYJRu/TGGjs6DYhuQ1F6IhELGeoA1hDI53fqgxcSyGfuexUqRMDdhdWt2kY1Y
         iukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        fh=aBaUhUfpImBti+bDMeBb28MBTZC3kXU2Uc0CJnZTkAc=;
        b=jENO8b6JErFDgi2HJQh1FOQ8H2LOWC9CxuLYD/bJLAubgpvXWqIdPldWADEv0iTU9G
         IFJ++k1fNZGjd/2R3WZDykmwGpEu6G8KrpGLTo5X4nc4lM0W3WaFSd+25SxItH6zS8dB
         g2riFKXLrHR8Y63lgP3oGvVeCwrp7on4i/6Yc7Yc0j0ntOEgr3XVoxSnsmZWCZMQOjok
         5kLttVo+TneSGQetN+NUyFvntMtAA+bdSs5/JXOXoCA3hip60xkiBbZ3YLO8g0UWpvar
         09HAgq0OBqfo7B1GNfjrex2j3xNApQuVRLRJ7wcjPZ0hPov1x5ASQpOvjhMbg5zvfSP9
         FaPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779032776; x=1779637576; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        b=fI0EWnjsukpcLnUkNtaLSC/Qiby213K56/bDBMEOGn3C9RXSrgg5zF5zRATDJx97QQ
         e2b6biUls5axHsXYXXDWT9oq22/BRfak1YPt5U0T1k8LySz6/FF2b8iLprWScI6UwGHP
         8c+RRZom7fi9bRYSe6xMX6T6XPv55K2eQ64ATvSYAmPYo6ZtQ9tMv485rM14AUyqfGKr
         +Mpe0kKpXNDXHTAPSMV/6C+HLytkSUilt564T3vtf+zKGo75dalpFl5bXpKcf22M3et8
         q6WhBx5R5XRAok1lhePSc9cfOlHUmQQ7jyKGvy1+xUEDDnlj5ppJFp5z9dJ+zYEkfnXB
         bkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032776; x=1779637576;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYRlW3PCDhz0IzjnRHKXHL7UperzWJzJHc5JdYc23sI=;
        b=ZLNa9Z+k5HzENwunS7+fbIJauq+Bi49IplKhoCbIak9EE7T+cHFZh9hMzELbH55jbS
         6TzQN+uu7ZkAo+ZpV4T/lTOzEueQxWxTbqSlgfoor7UfJrGKOKt1saZM+K3i7KRLFRTm
         MdItI+lP+wA+1WgxUHUeNPRsvC5JNLvC2DNZpzMkIRRhqjEuMjJre/+V8e7uqCYRp756
         c/fal0OdVA+Bf6Q5Mt6mVTOyLFng5j4n3DcXnwPsaXbhF5Q0JKF+yQiM6FV7M7IM8ac2
         kgopLPHuRd77uzmRqOsrBQ1dvZ0hMHhjWngxVhE2u3flMNR1wJCxc9PtMpdqO9Nbqhh9
         /QPA==
X-Forwarded-Encrypted: i=1; AFNElJ99o6OEd4CGyLMyzv1sB4aXrj4pVWywwRj4csn5Qq4IcDvFQFZJJ1D0K77JWJn28tAV4dDKyp/DmSMQIb7kaGVN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0BI6AR5Ho//b0CUgyGUlADToypblSYuNcfKW3iNG9T6uNLNLR
	rJqkF+vDRImqmJGvo5QOHpURafpmjxrIdQswI7Vx9H9rGsqbyioLBrnG5UoCeRl4fAX5ukDP/yb
	xJ5v2qMlY3P9Py/hShSnHYFQWFRI6u84=
X-Gm-Gg: Acq92OHcIAKnbyunFjyblw7XFFUzPtZ9jne7b0FfTyWcmNH0ixCHOvuC59xfMrY5JUi
	HMdIA6khjmQZpVfFEk5D+Nnm/TeK8w2AbZcmI2gKYomrFVUaY4ohcBPjQQF/Ms3+kN12RTU8AeS
	sdkWD0gvZNzApXRvQhkFgSnLnu64BGqzZ8MAX86H6Amna9V4ARrXXQbD0eNHZ7U3v2EV3TnXwcn
	v7fbzmEGhEIqxZ96sbvNuSAD7KY5q/kVoel2JX7ytrm81XSQg+KD6mNhix5x46vV+wBs8NXfbRG
	49GGdrvp
X-Received: by 2002:a5d:584c:0:b0:439:b8b2:fabc with SMTP id
 ffacd0b85a97d-45e5c587396mr16434984f8f.21.1779032776023; Sun, 17 May 2026
 08:46:16 -0700 (PDT)
MIME-Version: 1.0
From: Maoyi Xie <maoyixie.tju@gmail.com>
Date: Sun, 17 May 2026 23:46:04 +0800
X-Gm-Features: AVHnY4LrrtEQK1BvcqcA5igpV4UTqBBKgJzZy77GQaOmTQBQeSdR0fwkPx14Lu4
Message-ID: <CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
Subject: usb: gadget: aspeed_udc: list iterator used after loop in ast_udc_ep_dequeue
To: neal_liu@aspeedtech.com, gregkh@linuxfoundation.org
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a8c2340652055859"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_084619_716667_B46B0828 
X-CRM114-Status: GOOD (  24.86  )
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

--000000000000a8c2340652055859
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

(Resending from a personal address =E2=80=94 my previous attempt from
my NTU corporate account carried an auto-appended confidentiality
disclaimer that you've declined to accept. The content below is
unchanged.)

I have been running a small static check for list_for_each_entry
past-the-end patterns, similar to Jakob Koschel's 2022 cleanup
(commit 2966a9918df and related). The check flagged
ast_udc_ep_dequeue() in drivers/usb/gadget/udc/aspeed_udc.c, and I
would like to ask whether you consider this a real defect before I
send anything formal. The same code is present in v7.0 and in
v7.1-rc1 (the two files are byte-identical).

The code in question is around line 691:

    struct ast_udc_request *req;
    ...
    list_for_each_entry(req, &ep->queue, queue) {
        if (&req->req =3D=3D _req) {
            list_del_init(&req->queue);
            ast_udc_done(ep, req, -ESHUTDOWN);
            _req->status =3D -ECONNRESET;
            break;
        }
    }
    if (&req->req !=3D _req)
        rc =3D -EINVAL;

If nothing matches, the loop exits past-the-end and req becomes the
synthetic container_of(&ep->queue, struct ast_udc_request, queue).
Reading &req->req after the loop is undefined per C11. The post-loop
check works in practice only because real _req values do not collide
with that synthetic address.

What made me suspect this was not intentional is that 14 other UDC
drivers in the same directory (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc, max3420_udc,
net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx) use a
different pattern, with a separate iter cursor and a result variable.
For example dummy_hcd.c:

    struct dummy_request *req =3D NULL, *iter;
    list_for_each_entry(iter, &ep->queue, queue) {
        if (&iter->req !=3D _req) continue;
        ...
        req =3D iter;
        retval =3D 0;
        break;
    }
    if (retval =3D=3D 0) { ... }

aspeed_udc seems to be the only outlier in drivers/usb/gadget/udc/,
which is what made me think this was probably an oversight rather
than a deliberate idiom.

I also tried to confirm whether it observably misbehaves. If _req
happens to coincide with the synthetic past-the-end address, the
function returns 0 (success) on an empty queue without removing
anything. I attached a small userspace reproducer (poc_aspeed_udc.c
and its output log) that arranges this collision. In normal use _req
comes from the kernel slab and the collision is unlikely to happen
naturally, so I am not sure whether this rises to the level of a
real bug or just a code-quality issue.

Two questions:

  1. Do you consider the past-the-end use here a defect worth fixing,
     or is it an accepted idiom in this driver that I am misreading?

  2. If it is worth fixing, I already have a small patch that brings
     the function in line with the 14 sibling drivers. Would you like
     me to send it, or would you rather address it locally?

Thanks for taking a look, and apologies if I am off base on any of
this.

Best,
Maoyi Xie
--
Nanyang Technological University
https://maoyixie.com/

--000000000000a8c2340652055859
Content-Type: application/octet-stream; name="poc_aspeed_udc.c"
Content-Disposition: attachment; filename="poc_aspeed_udc.c"
Content-Transfer-Encoding: base64
Content-ID: <f_mp9y3fo61>
X-Attachment-Id: f_mp9y3fo61

LyoKICogVXNlcnNwYWNlIHJlcHJvZHVjZXIgZm9yIHRoZSBwYXN0LXRoZS1lbmQgaXRlcmF0b3Ig
YmVoYXZpb3IgaW4KICogYXN0X3VkY19lcF9kZXF1ZXVlKCkgKGRyaXZlcnMvdXNiL2dhZGdldC91
ZGMvYXNwZWVkX3VkYy5jKS4KICoKICogQXNwZWVkIFVEQyBpcyBCTUMvQVJNIGhhcmR3YXJlLiBS
YXRoZXIgdGhhbiBicmluZ2luZyB1cCBhIGZ1bGwgU29DCiAqIGVtdWxhdGlvbiwgdGhpcyBwcm9n
cmFtIGV4dHJhY3RzIHRoZSBkZXF1ZXVlIGZ1bmN0aW9uJ3MgbG9naWMgaW50bwogKiB1c2Vyc3Bh
Y2UgdXNpbmcgbW9jayBzdHJ1Y3RzIHdob3NlIGxheW91dCAocmVxIGF0IG9mZnNldCAwLCBxdWV1
ZQogKiBpbW1lZGlhdGVseSBhZnRlcikgbWF0Y2hlcyB0aGUga2VybmVsIGRlZmluaXRpb24uIEl0
IHRoZW4gcnVucyBib3RoCiAqIHRoZSBleGlzdGluZyBjb2RlIHBhdGggYW5kIHRoZSBwcm9wb3Nl
ZCBmaXggb24gdGhlIHNhbWUgY3JhZnRlZCBpbnB1dC4KICoKICogQnVpbGQ6IGNjIC1PMCAtZyBw
b2NfYXNwZWVkX3VkYy5jIC1vIHBvY19hc3BlZWRfdWRjCiAqIFJ1bjogICAuL3BvY19hc3BlZWRf
dWRjICAgICAgICAgICAoZXhpc3RpbmcgY29kZSwgcmV0dXJucyA0MikKICogICAgICAgIC4vcG9j
X2FzcGVlZF91ZGMgcGF0Y2hlZCAgIChwcm9wb3NlZCBmaXgsIHJldHVybnMgMCkKICovCiNkZWZp
bmUgX0dOVV9TT1VSQ0UKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2lu
Y2x1ZGUgPHN0cmluZy5oPgojaW5jbHVkZSA8c3RkZGVmLmg+CgovKiBNaW5pbWFsIG1vY2sgb2Yg
dGhlIGtlcm5lbCBsaXN0X2hlYWQgYW5kIGNvbnRhaW5lcl9vZi4gKi8Kc3RydWN0IGxpc3RfaGVh
ZCB7IHN0cnVjdCBsaXN0X2hlYWQgKm5leHQsICpwcmV2OyB9OwoKI2RlZmluZSBjb250YWluZXJf
b2YocHRyLCB0eXBlLCBtZW1iZXIpIFwKICAgICgodHlwZSAqKSgoY2hhciAqKShwdHIpIC0gb2Zm
c2V0b2YodHlwZSwgbWVtYmVyKSkpCgojZGVmaW5lIGxpc3RfZmlyc3RfZW50cnkocHRyLCB0eXBl
LCBtZW1iZXIpIFwKICAgIGNvbnRhaW5lcl9vZigocHRyKS0+bmV4dCwgdHlwZSwgbWVtYmVyKQoj
ZGVmaW5lIGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJlcikgXAogICAgY29udGFpbmVyX29mKChw
b3MpLT5tZW1iZXIubmV4dCwgdHlwZW9mKCoocG9zKSksIG1lbWJlcikKI2RlZmluZSBsaXN0X2Vu
dHJ5X2lzX2hlYWQocG9zLCBoZWFkLCBtZW1iZXIpIFwKICAgICgmKHBvcyktPm1lbWJlciA9PSAo
aGVhZCkpCgojZGVmaW5lIGxpc3RfZm9yX2VhY2hfZW50cnkocG9zLCBoZWFkLCBtZW1iZXIpICAg
ICAgICAgICAgICAgXAogICAgZm9yIChwb3MgPSBsaXN0X2ZpcnN0X2VudHJ5KGhlYWQsIHR5cGVv
ZigqcG9zKSwgbWVtYmVyKTsgXAogICAgICAgICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVh
ZCwgbWVtYmVyKTsgICAgICAgICAgICAgXAogICAgICAgICBwb3MgPSBsaXN0X25leHRfZW50cnko
cG9zLCBtZW1iZXIpKQoKc3RhdGljIHZvaWQgbGlzdF9pbml0KHN0cnVjdCBsaXN0X2hlYWQgKmgp
IHsgaC0+bmV4dCA9IGgtPnByZXYgPSBoOyB9CgovKiBNb2NrIHN0cnVjdHMuIE9ubHkgZmllbGQg
b3JkZXIgbWF0dGVyczogcmVxIGF0IG9mZnNldCAwLCBxdWV1ZQogKiBpbW1lZGlhdGVseSBhZnRl
ci4gKi8Kc3RydWN0IHVzYl9yZXF1ZXN0IHsKICAgIHZvaWQgKmJ1ZjsKICAgIHVuc2lnbmVkIGxl
bmd0aDsKICAgIGludCBzdGF0dXM7Cn07CgpzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0IHsKICAgIHN0
cnVjdCB1c2JfcmVxdWVzdCByZXE7CiAgICBzdHJ1Y3QgbGlzdF9oZWFkIHF1ZXVlOwogICAgaW50
IHBhZDsKfTsKCnN0cnVjdCBhc3RfdWRjX2VwIHsKICAgIHN0cnVjdCBsaXN0X2hlYWQgcXVldWU7
Cn07CgovKiBFeGlzdGluZyBjb2RlIHBhdGggZnJvbSBhc3BlZWRfdWRjLmMgYXJvdW5kIGxpbmUg
NjkxLiBMb2NrcyBhbmQKICogdGhlIGFzdF91ZGNfZG9uZSgpIGNhbGxiYWNrIGFyZSBlbGlkZWQg
c2luY2UgdGhlIHBhc3QtdGhlLWVuZAogKiBiZWhhdmlvciBpcyBpbmRlcGVuZGVudCBvZiB0aGVt
LiAqLwpzdGF0aWMgaW50IGFzdF91ZGNfZXBfZGVxdWV1ZV9leGlzdGluZyhzdHJ1Y3QgYXN0X3Vk
Y19lcCAqZXAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
dXNiX3JlcXVlc3QgKl9yZXEpCnsKICAgIHN0cnVjdCBhc3RfdWRjX3JlcXVlc3QgKnJlcTsKICAg
IGludCByYyA9IDA7CgogICAgbGlzdF9mb3JfZWFjaF9lbnRyeShyZXEsICZlcC0+cXVldWUsIHF1
ZXVlKSB7CiAgICAgICAgaWYgKCZyZXEtPnJlcSA9PSBfcmVxKSB7CiAgICAgICAgICAgIC8qIGxp
c3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBzZXQgc3RhdHVzIGhlcmUgKi8KICAgICAgICAg
ICAgYnJlYWs7CiAgICAgICAgfQogICAgfQoKICAgIC8qIFdoZW4gdGhlIGxvb3AgZmluZHMgbm8g
bWF0Y2gsIHJlcSBpcyBwYXN0LXRoZS1lbmQuIFJlYWRpbmcKICAgICAqICZyZXEtPnJlcSBpcyB1
bmRlZmluZWQgcGVyIEMxMTsgdGhlIHJlc3VsdGluZyBjaGVjayBpcyBhCiAgICAgKiBwcm9wZXJ0
eSBvZiBoZWFwIGxheW91dCByYXRoZXIgdGhhbiB0aGUgcXVldWUgY29udGVudHMuICovCiAgICBp
ZiAoJnJlcS0+cmVxICE9IF9yZXEpCiAgICAgICAgcmMgPSAtMjI7ICAgICAvKiAtRUlOVkFMICov
CgogICAgcmV0dXJuIHJjOwp9CgovKiBQcm9wb3NlZCBmaXggdXNpbmcgdGhlIHNlcGFyYXRlIGl0
ZXIgY3Vyc29yIHBhdHRlcm4gc2hhcmVkIGJ5IHRoZQogKiBvdGhlciBVREMgZHJpdmVycyBpbiB0
aGUgc2FtZSBkaXJlY3RvcnkgKGUuZy4gZHVtbXlfaGNkLmMpLiAqLwpzdGF0aWMgaW50IGFzdF91
ZGNfZXBfZGVxdWV1ZV9wYXRjaGVkKHN0cnVjdCBhc3RfdWRjX2VwICplcCwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHVzYl9yZXF1ZXN0ICpfcmVxKQp7CiAg
ICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpyZXEgPSBOVUxMLCAqaXRlcjsKCiAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGl0ZXIsICZlcC0+cXVldWUsIHF1ZXVlKSB7CiAgICAgICAgaWYgKCZpdGVy
LT5yZXEgIT0gX3JlcSkKICAgICAgICAgICAgY29udGludWU7CiAgICAgICAgcmVxID0gaXRlcjsK
ICAgICAgICBicmVhazsKICAgIH0KCiAgICBpZiAoIXJlcSkKICAgICAgICByZXR1cm4gLTIyOyAg
ICAgLyogLUVJTlZBTCAqLwoKICAgIC8qIGxpc3RfZGVsX2luaXQgKyBhc3RfdWRjX2RvbmUgKyBz
ZXQgc3RhdHVzIGhlcmUgKi8KICAgIHJldHVybiAwOwp9CgppbnQgbWFpbihpbnQgYXJnYywgY2hh
ciAqKmFyZ3YpCnsKICAgIGludCB1c2VfcGF0Y2hlZCA9IChhcmdjID4gMSAmJiAhc3RyY21wKGFy
Z3ZbMV0sICJwYXRjaGVkIikpOwoKICAgIHN0cnVjdCBhc3RfdWRjX2VwIGVwOwogICAgbGlzdF9p
bml0KCZlcC5xdWV1ZSk7CgogICAgLyogQW4gZW1wdHkgcXVldWUgZm9yY2VzIHRoZSBleGlzdGlu
ZyBjb2RlJ3MgaXRlcmF0b3IgcGFzdCB0aGUgZW5kLgogICAgICogcGFzdF9lbmQgaXMgdGhlIHN5
bnRoZXRpYyBhc3RfdWRjX3JlcXVlc3QgcG9pbnRlciB0aGUgbG9vcCB3aWxsCiAgICAgKiBsZWF2
ZSBiZWhpbmQuIEJlY2F1c2UgcmVxIGlzIHRoZSBmaXJzdCBtZW1iZXIsICZwYXN0X2VuZC0+cmVx
CiAgICAgKiBoYXMgdGhlIHNhbWUgbnVtZXJpYyB2YWx1ZSBhcyBwYXN0X2VuZCBpdHNlbGYuICov
CiAgICBzdHJ1Y3QgYXN0X3VkY19yZXF1ZXN0ICpwYXN0X2VuZCA9CiAgICAgICAgY29udGFpbmVy
X29mKCZlcC5xdWV1ZSwgc3RydWN0IGFzdF91ZGNfcmVxdWVzdCwgcXVldWUpOwogICAgc3RydWN0
IHVzYl9yZXF1ZXN0ICpmYWtlX3JlcSA9ICZwYXN0X2VuZC0+cmVxOwoKICAgIHByaW50ZigiW3Nl
dHVwXSBlcC5xdWV1ZT0lcCAoaGVhZClcbiIsICh2b2lkICopJmVwLnF1ZXVlKTsKICAgIHByaW50
ZigiW3NldHVwXSBwYXN0X2VuZD0lcFxuIiwgKHZvaWQgKilwYXN0X2VuZCk7CiAgICBwcmludGYo
IltzZXR1cF0gZmFrZV9yZXE9JXBcbiIsICh2b2lkICopZmFrZV9yZXEpOwoKICAgIGludCByYzsK
ICAgIGlmICh1c2VfcGF0Y2hlZCkgewogICAgICAgIHJjID0gYXN0X3VkY19lcF9kZXF1ZXVlX3Bh
dGNoZWQoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIHBhdGNoZWQgcmM9
JWRcbiIsIHJjKTsKICAgIH0gZWxzZSB7CiAgICAgICAgcmMgPSBhc3RfdWRjX2VwX2RlcXVldWVf
ZXhpc3RpbmcoJmVwLCBmYWtlX3JlcSk7CiAgICAgICAgcHJpbnRmKCJbcHJvYmVdIGV4aXN0aW5n
IHJjPSVkXG4iLCByYyk7CiAgICB9CgogICAgaWYgKHJjID09IDApIHsKICAgICAgICBwcmludGYo
IltyZXN1bHRdIHJldHVybmVkIDAgKHN1Y2Nlc3MpIG9uIGVtcHR5IHF1ZXVlIHdpdGhvdXQgIgog
ICAgICAgICAgICAgICAicmVtb3ZpbmcgYW55dGhpbmdcbiIpOwogICAgICAgIHJldHVybiA0MjsK
ICAgIH0KICAgIHByaW50ZigiW3Jlc3VsdF0gcmV0dXJuZWQgJWQgKHJlamVjdGVkKVxuIiwgcmMp
OwogICAgcmV0dXJuIDA7Cn0K
--000000000000a8c2340652055859
Content-Type: application/octet-stream; name="poc_aspeed_udc.log"
Content-Disposition: attachment; filename="poc_aspeed_udc.log"
Content-Transfer-Encoding: base64
Content-ID: <f_mp9y3fnz0>
X-Attachment-Id: f_mp9y3fnz0

JCAuL3BvY19hc3BlZWRfdWRjCltzZXR1cF0gZXAucXVldWU9MHg3ZmZlZmUwYjFjZDAgKGhlYWQp
CltzZXR1cF0gcGFzdF9lbmQ9MHg3ZmZlZmUwYjFjYzAKW3NldHVwXSBmYWtlX3JlcT0weDdmZmVm
ZTBiMWNjMApbcHJvYmVdIGV4aXN0aW5nIHJjPTAKW3Jlc3VsdF0gcmV0dXJuZWQgMCAoc3VjY2Vz
cykgb24gZW1wdHkgcXVldWUgd2l0aG91dCByZW1vdmluZyBhbnl0aGluZwoKJCAuL3BvY19hc3Bl
ZWRfdWRjIHBhdGNoZWQKW3NldHVwXSBlcC5xdWV1ZT0weDdmZmVlNjQ4ZWVlMCAoaGVhZCkKW3Nl
dHVwXSBwYXN0X2VuZD0weDdmZmVlNjQ4ZWVkMApbc2V0dXBdIGZha2VfcmVxPTB4N2ZmZWU2NDhl
ZWQwCltwcm9iZV0gcGF0Y2hlZCByYz0tMjIKW3Jlc3VsdF0gcmV0dXJuZWQgLTIyIChyZWplY3Rl
ZCkK
--000000000000a8c2340652055859--


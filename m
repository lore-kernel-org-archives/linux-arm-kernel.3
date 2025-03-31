Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF71DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNl1SQVso5nPetlh9Qg8VypRynUIXBscKzedhkhwXUc=; b=B6AA9vbZllujTZlI1VNMWG6cZK
	61hQEyoedGD1JEzinUiu1xci9wWvjZg27LhgD8k8DTVe4pZb4Zt3v2kLTCLg0s0EgoVOmxBBr36et
	XE1IiDG7t8ZDt3LQwB/LoeKMD1To7lFfiaJDUXjRPMVWcjr4Cq9jniCFiFOYyb9ZQstAhCUDeOtC6
	yAXdFO19+nYQKdRqzY7ryMCJaXzCd/TQv72ene6z2+M+AZ/YEhO12nXdBMDnNpgY9yn5bOSYlzbxm
	+MpnUi0kiL+p7s5hGnUiCG8qylxDTX+Yl1rJ4t/8Lg43Jizv95lWUZIjVuiVR6C7a34TYp72CIuc7
	TkUAjCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFw4-00000000Whi-2ShA;
	Mon, 31 Mar 2025 14:16:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFuN-00000000WSo-12IL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:14:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34815205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743430474; x=1744035274; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DNl1SQVso5nPetlh9Qg8VypRynUIXBscKzedhkhwXUc=;
        b=TB1ycQYu1INNjlxrr+66oY6DfniVpS+eoPeA4m2+kaiOj/qBRPfCOv8Xt8LQkrv9Vy
         QprgIi3n1i8kR1X9NUQiDgwdNytajKVJclrEp8v/sbfSG7kFslYdm+UbCp02sSS4+cVl
         mPrsUX/rzfzvTxwH3wa7UqCzZRnHt+KiCGWj8NuN1m94cjq5RaFXxdJUhsi97peAchu/
         eb/lveSxQ6D1EZc2JGPA68PfyfnB7Fv+elO7HV9/HqMoOGFR8VM4GpqkT3Va7Z8yTDwT
         YnS0N+1Pz8hqsKE1oQjZynWGwwcx57h0DjOazG4Z8q+3J+jEu/EtlZHF1ONaCSjo3VuK
         RSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430474; x=1744035274;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNl1SQVso5nPetlh9Qg8VypRynUIXBscKzedhkhwXUc=;
        b=pCSIyuk+0nfiMxQHooLzl/UsNtn/U7FpTHYDvGeuai6XeVcn27yvt7XDOg0HHM9l9D
         DqALECtXYAp5O+3oT0wsop67XQ3EqRo19bvftoP+btHHmJgNOSMR5bFt0fH3yt1dxjzu
         liP0088C5yBRv9tOepwVp80CxXHSC43yEHbnOxtgjecL7aaadBsG7B3e3WPo4Hi7XIPj
         uS9oPLZk4lrB+ldQ4uXHbX75ZhRH1Ev4zulwnrG4X1axAs06Va9f/izgeD246piJpi4O
         Uu/Jcw63OEr9ZREjydAxMS76hkutBLWccYczmDXhY7cEvIr9jchzYAL34jpaHZesnVaA
         GaYg==
X-Forwarded-Encrypted: i=1; AJvYcCV95ASpHEUFw1PqmR0kwxgqXowadDLMiGK5VSSWddj6Jlh3ONdmgfphkL6H4F/rzc7JB5/sYi+WcNqffvroDCyt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/VlIw+fKHSHW7HPt6T4bbIr7fote/UwX6dMeJ/i1cYoJj3X02
	YaOZmPAq3p/b+vLfCvRYyCfGYJ7ENLI21upXCmgRaSmP0N1MAwF6675Iy1j41aBevY0lkOE3dnt
	moMI=
X-Gm-Gg: ASbGncsEHp3zCSgUfx32vrbr0s2WrJfIcz0UZCdyTeS8QpMjL0zDn3baN0VgXrKSWN5
	jWHrBIZdMHOYbHvpB7yjYsgpcB1jJNvDVDst0jE9rPcYsAINNIgYXIPvIG+e9L3hRumRJwbXqrL
	N5pfARD8g1lPKAAp4mbyKJAxL8mZnVVc4mFYW3p8/aXD3iRgyoDTDSYfXnIgpHIGgoNi/vFksII
	N1TORu5BoaclZsWyzVmwB8T2RWRedlWKC+o58M2GTUSdo2tbqpgglC7cPq7m/UauNdaCe2pkmYt
	Os7Ar2DOs78m/ycAH9ztAa9FmCo7QriVdeokIj3//MreLHlNOE31BI9I1UQI
X-Google-Smtp-Source: AGHT+IHYQ+fXxFbCgRTfptaLXGgLLqMHt7YG/1Wimd7zu4F5wOBY6YezfdivdUDny1H0tltHTbiNqQ==
X-Received: by 2002:a7b:c3d8:0:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43e7a5426d0mr52488485e9.13.1743430473620;
        Mon, 31 Mar 2025 07:14:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b6588dbsm11226229f8f.2.2025.03.31.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:14:33 -0700 (PDT)
Date: Mon, 31 Mar 2025 17:14:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: [bug report] Coresight: Allocate trace ID after building the path
Message-ID: <669d3cd7-6dce-48cd-a409-567ebfaa5309@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_071435_285055_1320D857 
X-CRM114-Status: UNSURE (   8.45  )
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

Hello Jie Gan,

Commit d87d76d823d1 ("Coresight: Allocate trace ID after building the
path") from Mar 3, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/hwtracing/coresight/coresight-core.c:697 coresight_path_assign_trace_id()
	warn: assigning signed to unsigned: 'path->trace_id = trace_id' 's32min-(-1),1-s32max'

drivers/hwtracing/coresight/coresight-core.c
    681 void coresight_path_assign_trace_id(struct coresight_path *path,
    682                                     enum cs_mode mode)
    683 {
    684         struct coresight_device *sink = coresight_get_sink(path);
    685         struct coresight_node *nd;
    686         int trace_id;
    687 
    688         list_for_each_entry(nd, &path->path_list, link) {
    689                 /* Assign a trace ID to the path for the first device that wants to do it */
    690                 trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
    691 
    692                 /*
    693                  * 0 in this context is that it didn't want to assign so keep searching.
    694                  * Non 0 is either success or fail.
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
True enough...  coresight_etm_get_trace_id() returns -EINVAL on error.

    695                  */
    696                 if (trace_id != 0) {
--> 697                         path->trace_id = trace_id;
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
It doesn't make sense to store -EINVAL in a u8.

    698                         return;
    699                 }
    700         }
    701 }

regards,
dan carpenter


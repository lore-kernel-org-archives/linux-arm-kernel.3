Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 03:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVXyH/TwSzdCUV+a7THlnl3JNi6YLAM042pC5ymDPyM=; b=dq5+nraYCK2riGRj/jif1BWZ85
	lT0FrCHG50P6+LiF9VsLSLqsfdniqTGxBQ2LkwsFmy9hIKZs9EMywdoX7TvbF3QwPwXn803lTKKTk
	QASAuwSQ/5FVgjXuOBJ57vA5eb+jtQFsnaidDyVmZ1WOn+0EiVIQix4zrxBQu30b2HiyQ4Jvj9E6w
	a8qNM3Ppgza1CRAesjztPWXCx1pjPvkXsPa6B2vq4h9lynwN7meRVzTc+PUCcTmXucypnNDg6lhSv
	Up8ps1lpjjXWbLWzFfjgfxepKbobxJmHxAdwUzGmRAIG7t/gLrKXwkjc6kfHSlck9B+wBpi9gwQQJ
	QA9c3Gkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj715-000000080js-1HbU;
	Mon, 13 Jul 2026 03:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj713-000000080jX-2Gg2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 03:07:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D29QAm050844
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 03:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OVXyH/TwSzdCUV+a7THlnl3JNi6YLAM042pC5ymDPyM=; b=fRsEJX7bZx4r/kpP
	B62dvhxpExLKtOUpw/96+r8FV7xFcaKFHJUrJ0Mxklu3hOqukq5VhiUujYlsemtg
	d+c0MQUDkgy31tnW1cTarp9jEoyIVA01UXWpqlYugQGXvh2KIf3YM5GiecsI7+LI
	plV5OTmJWiRP1wir3tAzhaGvq4lUnk34/LOAaQdpUBfGuDiJ1AYLBpCMylK1UwhC
	vX2KXZHALhF60BuKeEyIWWNfMDQaS926UXCuI4Z6voPuvU258soonpLaCMv2rIqx
	hgYcFIBhxbPMxc4R8rvrriYw3KNAbxc5/un2irJpufLUqBeSXDzcmCBokp85ju/1
	P6qQVQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamv5dx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 03:07:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so3164813a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 20:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783912050; x=1784516850; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVXyH/TwSzdCUV+a7THlnl3JNi6YLAM042pC5ymDPyM=;
        b=ACTd4eY7NN0oF+zj3DAKE1fycFZsK7yzzrEQNkhGybQ0+gcKMcdQs6xNbGz+nDKcXt
         HAQuZ6E7TckMOhorTUnfQiUEPIsKXjNzGIolKqD/woBSpso8sfCKsXdpGjE3WkJfZY7/
         lI3G3tBU2F5tRtc0DJa9uYMofK+lI1DLbvx8TDDlXWxx4NUquEbukNP9V0rBfvecDoQ4
         2LsC7o14ujEY5O/45ABxdd+C/EasMIQ7fzPzIB0SwEdcZ+NHCIIzxaka1f4c2ZAq2BmG
         TCvkPilVMUxy+8CJs9Am5hPUyKSkEaKWCY5mVhkHBhTIh3ir17SI8VqKq0tSPT5Pk5Rv
         HYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783912050; x=1784516850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVXyH/TwSzdCUV+a7THlnl3JNi6YLAM042pC5ymDPyM=;
        b=R50YEM2IwLTuhIZ9ryzrRrlY7rBXr/RN3jwspWI5MNQXx3TRIlWEPC0wDvy4hPmXrZ
         WEfjNyLpS1EjmEMMI3knmMtUaCAYuph1IqxDiJjgCYEZHZyz1QDKIfsxvPchAXrSNvw0
         rIkGfK0W/LnsHeXKcya6PMPdWgarzf8drZ+XdYLf3ay4S2f/Enme0t+0GHF7PD7HYEct
         aNE6G/FLAoWFczVgTEukm+tSR/3BR7OyWyCC396G+fQwNPFs7bvgWYhc89eEwfz3iG/y
         JChoty6OWLfM4nGLveuODwDalqPo0A90ZPUELHYOzjbm4Tc+yoUx/UkzNviShvicGBZM
         GK+g==
X-Forwarded-Encrypted: i=1; AHgh+RqxhS0N3mLiECIZksi2gUdd13ssHmQsSz9cK7LPv3wkOoocwSJ1bDCWgR5OFEL3rRz3PzXdVLkGqMBalgta4ns0@lists.infradead.org
X-Gm-Message-State: AOJu0YwWoopY25JYTUzeGof88/6MoxEaKJqTmT5FDbAs2W6EVdcWpuQe
	02cfFvamfg7HY3rPiKmi6fFP+gDbg6BTLS0oCd2UdNoiKP6hNYY+08/WyhDf0MHAgoliwxX9I8L
	wfUlymFUI8HNC37eib3yx39shHB64LzTHLD/suQL3ABrJfacb7YQR7OuFrnsc2um3IjMV4lHTAC
	EEaLahO0gFHNJn
X-Gm-Gg: AfdE7cllHR+86pSWWbKU+mq84LSytsRnCYFn1bD1XLeIbhbBKwqGfazSYcrHdf2mFCQ
	+YHvYshVx0Y6BaZjrpSAk3jPbtULyWIRWEx0JHUqHSXUET/DIU6o/IGtVtYlzJc2msu+Katy7yZ
	I9HhQn3JuXQYc+YbbIY02fHURobH03YCN6MuHyvTyfPVXDev7yilGHdiDlymtFQ+HivoW78orb0
	LBtgw2zByC4lGKHIYc+Q2tLV/1IxR9Bd9RLUXIbqfTaGmqnPH5o03CCZtlxCzcswNxqI18VClYt
	HETH+57PChcn5fI12u27WQrjFy/zEA0rcHwmgKkxSQQlvasxJpmJvX61XrPF3HbCa43fwcSgb+z
	/LO7ho2LZQDGkpg60eSv/TkFXWlCuMXrpHnYVX7zzHldZ5tEl01UqoTVtr0mStveDulljLBVUDy
	wA
X-Received: by 2002:a05:6a20:3d8b:b0:3b3:f46:1ef3 with SMTP id adf61e73a8af0-3c110b43746mr9251123637.41.1783912050130;
        Sun, 12 Jul 2026 20:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d8b:b0:3b3:f46:1ef3 with SMTP id adf61e73a8af0-3c110b43746mr9251095637.41.1783912049636;
        Sun, 12 Jul 2026 20:07:29 -0700 (PDT)
Received: from [10.133.33.216] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm5950477a12.6.2026.07.12.20.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 20:07:29 -0700 (PDT)
Message-ID: <03d9499c-4566-423d-9bdc-ef3efd4f0119@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:07:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: Fix scheduling while atomic in
 coresight_device_release()
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS"
 <coresight@lists.linaro.org>,
        "moderated list:ARM/CORESIGHT FRAMEWORK AND DRIVERS"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT"
 <linux-rt-devel@lists.linux.dev>
References: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260712210446.14290-1-mohamedaymanworkspace@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAyOCBTYWx0ZWRfX+DxGR2cbRwlg
 iBzDPVxPNPYrbKVgrUKxr1XPrYJu2MQn8zNytDzbhtwOefyXefHiQo5KL5rBGQg/x9LRTkfo0Aw
 BhlwUT6JWb5sI8d6ryEBZBjhNe1uG3s=
X-Proofpoint-GUID: QyLh5flTxIlz2hdOgbLwWQ6qodtHdQRp
X-Proofpoint-ORIG-GUID: QyLh5flTxIlz2hdOgbLwWQ6qodtHdQRp
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a545673 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=bKUmyqtfEAg2hwmyn8cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAyOCBTYWx0ZWRfX1asMTcFBbzi+
 o+nxp7s6zHqxwkThgy2m0oFsdgIM7c/hJNxMjdni1IqtKi8X/AzCRAqkizy6ZzexoITVHHGQAqn
 ip3EePv3d77OW6h/sHFQ+UQA8z5GYBtH2Z6Jn5j5Ko5rOI/B1iUEIdsd5q0efC64J9Q75xzux10
 JzMZbr/lwbd/hxa/g+8D/vq0LReHQhiQ3E4jsEMGjOQnknkpc+/MhhU+QUtYTMJJpnMRTSb2U2D
 LwfplfiqOFL6VR0kayLcYfI2zIPGhu+qIv1f/o1axzENMPZsSz6Of44GMVHiX+b6ZNNEF78gDAu
 rYrJiZyCMG9beKkF79uiYRkGp/GnaW6GMnWPuXoi+K0WR22BJkaMeCfHIY6PqkRgiLlagWz4I1T
 YiNYXgfbFUp9o7vk7kIA85VAoVCAWBvRB5Z3fx6fLzc899ramnW/oBje86gqdFHzZwqMMrJXy7z
 n6trK1nPm3LFwCNgtbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_200733_722333_69639F0B 
X-CRM114-Status: GOOD (  33.24  )
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



On 7/13/2026 5:04 AM, Mohamed Ayman wrote:
> Dropping the last reference to a coresight_device can trigger a kernel
> panic on PREEMPT_RT builds due to a "scheduling while atomic" violation.
> 
> When the CPU enters an idle state, coresight_cpu_pm_notify() is invoked
> with local interrupts disabled (atomic context). This function eventually
> calls coresight_put_percpu_source_ref(), which drops the device reference
> via put_device(). If this is the last reference, it triggers the release
> chain:
> 
>    coresight_cpu_pm_notify() (IRQs off)
>      -> coresight_put_percpu_source_ref()
>        -> put_device()
>          -> coresight_device_release()
>            -> free_percpu()
> 
> On a PREEMPT_RT kernel, free_percpu() acquires pcpu_lock, which is
> implemented as a sleeping rt-mutex. Sleeping while in an atomic context
> causes a system crash.
> 
> Fix this by deferring the teardown of the coresight_device to process
> context. Add a work_struct to `struct coresight_device` and use
> schedule_work() inside coresight_device_release() to safely execute
> free_percpu() and kfree() in a worker thread, away from the atomic PM
> notifier path.
> 
> Additionally, remove the redundant raw_spinlock_irqsave guard in

The code diff doesnt include this description.

> coresight_put_percpu_source_ref(). The lock was originally intended to
> protect the per-CPU pointer table, but dropping a reference does not
> touch this table.
> 
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 28 +++++++++++++-------
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6d65c43d5..9dbdb2977 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -165,13 +165,6 @@ void coresight_put_percpu_source_ref(struct coresight_device *csdev)
>   
>   	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
>   
> -	/*
> -	 * TODO: coresight_device_release() is invoked to release resources when
> -	 * the device's refcount reaches zero. It then calls free_percpu(),
> -	 * which acquires pcpu_lock — a sleepable lock when PREEMPT_RT is
> -	 * enabled. Since the raw spinlock coresight_dev_lock is held, this can
> -	 * lead to a potential "scheduling while atomic" issue.
> -	 */
>   	put_device(&csdev->dev);
>   }
>   
> @@ -1257,13 +1250,30 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
>   	}
>   }
>   
> +static void coresight_device_release_work(struct work_struct *work)
> +{
> +	struct coresight_device *csdev =
> +		container_of(work, struct coresight_device, free_work);
> +
> +	free_percpu(csdev->perf_sink_id_map.cpu_map);
> +	kfree(csdev);
> +}
> +
>   static void coresight_device_release(struct device *dev)
>   {
>   	struct coresight_device *csdev = to_coresight_device(dev);
>   
>   	fwnode_handle_put(csdev->dev.fwnode);
> -	free_percpu(csdev->perf_sink_id_map.cpu_map);
> -	kfree(csdev);
> +
> +	/*
> +	 * This release callback can run with the last reference dropped
> +	 * from atomic/IRQs-off context (e.g. coresight_put_percpu_source_ref()
> +	 * called from the CPU_PM notifier). free_percpu() takes pcpu_lock,
> +	 * which is a sleeping lock under PREEMPT_RT, so defer the actual
> +	 * teardown to process context.
> +	 */
> +	INIT_WORK(&csdev->free_work, coresight_device_release_work);
> +	schedule_work(&csdev->free_work);

Consider the module unload process, the async work can lead to UAF:
For example:

1. unload ETM4X module:
coresight_unregister() -> device_unregister() -> put_device() -> ref 0
-> coresight_device_release() -> schedule_work(&csdev->free_work)

At this point, the release work is only queued, while the ETM4X module 
unload path proceeds as if the release operation has finished.

2. unload the coresight module without flushing the workqueue
3. A UAF occurs when the pending work is eventually executed and 
attempts to free csdev via coresight_device_release_work(), after the 
relevant code or resources have already been unloaded.

We must drain out the workqueue in coresight_exit to close the gap.

Thanks,
Jie

>   }
>   
>   static int coresight_orphan_match(struct device *dev, void *data)
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ddf18c970..63253f6c4 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -13,6 +13,7 @@
>   #include <linux/perf_event.h>
>   #include <linux/sched.h>
>   #include <linux/platform_device.h>
> +#include <linux/workqueue.h>
>   
>   /* Peripheral id registers (0xFD0-0xFEC) */
>   #define CORESIGHT_PERIPHIDR4	0xfd0
> @@ -293,6 +294,7 @@ struct coresight_device {
>   	struct csdev_access access;
>   	struct device dev;
>   	struct coresight_path *path;
> +	struct work_struct free_work;
>   	atomic_t mode;
>   	int refcnt;
>   	int cpu;


